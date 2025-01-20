@interface IDSGroupEncryptionController1
+ (BOOL)isKeyRatchetingEnabledForPlatform;
+ (id)sharedInstance;
- ($AFFB3261E48324223FE33B3CF9FC7872)participantsReadyForKeyMaterialsForGroup:(SEL)a3;
- (BOOL)_alreadyLocked_shouldRatchetForGroup:(id)a3;
- (BOOL)_isMemberLightweight:(id)a3 lightweightStatusDict:(id)a4;
- (BOOL)_isMemberStandard:(id)a3 lightweightStatusDict:(id)a4;
- (BOOL)_isUsingAccount:(id)a3;
- (BOOL)_isValidPushToken:(id)a3;
- (BOOL)_shouldEnforceRemoteTimeout;
- (BOOL)_storePendingKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 hasValidMKM:(BOOL)a5 hasValidSKM:(BOOL)a6 forDevice:(id)a7;
- (BOOL)fakeMKMWrapping;
- (BOOL)isTestRunning;
- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9;
- (IDSDSessionController)sessionController;
- (IDSGroupEncryptionController1)init;
- (IDSRealTimeEncryptionIdentity)identityForDevice;
- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice;
- (NSMutableDictionary)groupIDToKeyMaterialCache;
- (NSMutableDictionary)groupIDToStableKeyMaterialCache;
- (__SecKey)fullIdentityKey;
- (__SecKey)localPrivatePreKey;
- (__SecKey)localPublicPreKey;
- (__SecKey)previousFullIdentityKey;
- (__SecKey)previousLocalPrivatePreKey;
- (__SecKey)previousLocalPublicPreKey;
- (__SecKey)publicKeyForPushToken:(id)a3;
- (double)_multiwayFTMessageSendTimeout;
- (double)mkmRatchetMaxWaitWindow;
- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5;
- (id)_ensureGroupStableKeyMaterialCacheForGroup:(id)a3;
- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6;
- (id)_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:(id)a3 waitingParticipants:(id)a4 addedParticipantsDiff:(id)a5 currentParticipantsPushTokens:(id)a6 participantType:(int64_t)a7;
- (id)_getSetofStandardParticipantsForGroup:(id)a3;
- (id)_localDevicePushToken;
- (id)_locked_ensureGroupMasterKeyMaterialCacheForGroup:(id)a3;
- (id)_protectedCachedKeyMaterialsForDestination:(id)a3 pushToken:(id)a4 forGroup:(id)a5 outURIs:(id *)a6 includePeers:(BOOL)a7;
- (id)_pruneInvalidAndLocalPushTokensFromTokens:(id)a3;
- (id)_pruneLightweightParticipantsForGroupID:(id)a3 forTokens:(id)a4;
- (id)activeParticipantsForGroup:(id)a3;
- (id)addPreKeyChangeHandler:(id)a3;
- (id)allParticipantsInfoForGroup:(id)a3;
- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4;
- (id)createStableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)deriveKeyMaterial:(id)a3 withInfo:(id)a4;
- (id)deriveMKI:(id)a3 withInfo:(id)a4;
- (id)deriveMKM:(id)a3 withInfo:(id)a4;
- (id)deriveMKS:(id)a3 withInfo:(id)a4;
- (id)destinationsExcludingSelfForDestinations:(id)a3;
- (id)getLightweightStatusDictForGroup:(id)a3;
- (id)getMembersForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3;
- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4;
- (id)getParticipantsInfoForGroup:(id)a3;
- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForKeyMaterials:(id)a3;
- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3;
- (id)keyMaterialCacheToGroup:(id)a3;
- (id)masterKeyMaterialForGroup:(id)a3;
- (id)p2pNegotiatorProvider;
- (id)participantIDsForURIs:(id)a3 group:(id)a4;
- (id)participantInfoByURIForGroup:(id)a3;
- (id)publicKeys;
- (id)realTimeEncryptionPublicKeyData;
- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3;
- (id)realTimeEncryptionPublicKeyForDevice:(id)a3;
- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12;
- (id)remotePushTokensForGroup:(id)a3;
- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (id)stablekeyMaterialCacheToGroup:(id)a3;
- (int64_t)realTimeEncryptionPublicKeyWrappingMode;
- (int64_t)realTimeEncryptionPublicWrapModeForDevice:(id)a3;
- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5;
- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3;
- (unint64_t)localParticipantIDForGroupID:(id)a3;
- (unint64_t)participantIDForPushToken:(id)a3;
- (void)_alreadyLocked_sendRatchetedKeyMaterials:(id)a3 toAVC:(id)a4;
- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6;
- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6 waitingParticipantsTokens:(id)a7;
- (void)_dispatchRenewPrekeyTimer;
- (void)_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6;
- (void)_handleMkmExpirationTimerForGroup:(id)a3;
- (void)_handleMkmRollTimerForGroup:(id)a3;
- (void)_initializeParticipantsWaitingForInitialKeyMaterialsForGroup:(id)a3;
- (void)_locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:(id)a3 remoteToken:(id)a4 previousRemotePublicKey:(id)a5 newRemotePublicKey:(id)a6;
- (void)_mkmRollTimerFiredForGroup:(id)a3 sessionID:(id)a4;
- (void)_noteKeyMaterialDidSendToDestination:(id)a3 groupID:(id)a4 withSuccess:(BOOL)a5;
- (void)_noteKeyMaterialNotNeededForDestination:(id)a3 groupID:(id)a4;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9 isFirstSession:(BOOL)a10;
- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 shouldGenerateMKM:(BOOL)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10 isFirstSession:(BOOL)a11;
- (void)_resetKeyCacheForGroup:(id)a3;
- (void)_sendKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldIncludeCachedPeerKeyMaterial:(BOOL)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8;
- (void)_sendKeyRecoveryRequestForPendingKeys:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5 forDevice:(id)a6;
- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12;
- (void)_sendRenewedPrekeysToGroups;
- (void)_startKeyRecoveryForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6;
- (void)_startMkmExpirationTimer:(int)a3 forGroupID:(id)a4 block:(id)a5;
- (void)_startMkmRollTimer:(int)a3 forGroupID:(id)a4 block:(id)a5;
- (void)_stopMkmExpirationTimerForGroup:(id)a3;
- (void)_stopMkmRollTimerForGroup:(id)a3;
- (void)_updateAllActiveParticipantsInfoFromParticipants:(id)a3 standardParticipantsPushTokens:(id)a4 lightweightParticipantsPushTokens:(id)a5 groupID:(id)a6;
- (void)_updateLightweightParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3;
- (void)_updateStandardParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4;
- (void)cleanUpExpiredMasterKeyMaterial;
- (void)createKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4;
- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5;
- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8;
- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6;
- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5;
- (void)notifyPreKeyChange;
- (void)notifyStableKeyMaterialsReceivedForGroup:(id)a3 sessionID:(id)a4;
- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10;
- (void)processIncomingPrekeyAckForGroup:(id)a3;
- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9;
- (void)ratchetAndSendKeyMaterialsToAVCForGroup:(id)a3 sessionID:(id)a4;
- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6;
- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)removeAccountForGroup:(id)a3;
- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4;
- (void)removeExpiredPrekeys;
- (void)removeLocalActiveParticipantForGroup:(id)a3;
- (void)reportPrekeyAckStatus:(id)a3;
- (void)reportTimeDifferenceBetweenFirstPacketAndMKI:(int64_t)a3 forMKI:(id)a4 service:(id)a5 activeParticipants:(int64_t)a6;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5;
- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
- (void)resetDevicePrekey;
- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3;
- (void)resetKeyMaterialLocalSentStatus:(id)a3;
- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4;
- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4;
- (void)resetMKMLocalSentStatus:(id)a3;
- (void)resetSKMLocalSentStatus:(id)a3;
- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4;
- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 groupID:(id)a5 sessionID:(id)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8;
- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 participantID:(id)a5 groupID:(id)a6 sessionID:(id)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9;
- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5;
- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7;
- (void)sendKeyMaterialsToLocal:(id)a3 sessionID:(id)a4;
- (void)sendKeyMaterialsToWaitingParticipantsForGroup:(id)a3 sessionID:(id)a4;
- (void)sendPendingKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 forDevice:(id)a5 fromURI:(id)a6;
- (void)sendPrekeyRequestToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)sendPrekeyRequestToGroup:(id)a3 sessionID:(id)a4;
- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5;
- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4;
- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5;
- (void)setFakeMKMWrapping:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6;
- (void)setSessionController:(id)a3;
- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4;
- (void)unsubscribeEndpointsForGroup:(id)a3;
- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7;
- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4;
@end

@implementation IDSGroupEncryptionController1

+ (id)sharedInstance
{
  if (qword_100A4A8F0 != -1) {
    dispatch_once(&qword_100A4A8F0, &stru_1009847F0);
  }
  v2 = (void *)qword_100A4A8F8;

  return v2;
}

- (IDSGroupEncryptionController1)init
{
  v110.receiver = self;
  v110.super_class = (Class)IDSGroupEncryptionController1;
  v2 = [(IDSGroupEncryptionController1 *)&v110 init];
  if (v2)
  {
    v3 = +[IMLockdownManager sharedInstance];
    v2->_isInternal = [v3 isInternalInstall];

    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    prekeyAckCountForGroup = v2->_prekeyAckCountForGroup;
    v2->_prekeyAckCountForGroup = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    publicKeyForDevice = v2->_publicKeyForDevice;
    v2->_publicKeyForDevice = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToKeyMaterialCache = v2->_groupIDToKeyMaterialCache;
    v2->_groupIDToKeyMaterialCache = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToStableKeyMaterialCache = v2->_groupIDToStableKeyMaterialCache;
    v2->_groupIDToStableKeyMaterialCache = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToMKMExpirationTimer = v2->_groupIDToMKMExpirationTimer;
    v2->_groupIDToMKMExpirationTimer = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToMKMExpirationTimerBlock = v2->_groupIDToMKMExpirationTimerBlock;
    v2->_groupIDToMKMExpirationTimerBlock = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToMKMRollTimer = v2->_groupIDToMKMRollTimer;
    v2->_groupIDToMKMRollTimer = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToMKMRollTimerBlock = v2->_groupIDToMKMRollTimerBlock;
    v2->_groupIDToMKMRollTimerBlock = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToMKMRecoveryRetryCount = v2->_groupIDToMKMRecoveryRetryCount;
    v2->_groupIDToMKMRecoveryRetryCount = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToSKMRecoveryRetryCount = v2->_groupIDToSKMRecoveryRetryCount;
    v2->_groupIDToSKMRecoveryRetryCount = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToIsKeyMaterialRecoveryRunning = v2->_groupIDToIsKeyMaterialRecoveryRunning;
    v2->_groupIDToIsKeyMaterialRecoveryRunning = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToIsDeferredPreKeyRequestPending = v2->_groupIDToIsDeferredPreKeyRequestPending;
    v2->_groupIDToIsDeferredPreKeyRequestPending = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToInitialKeyMaterialDistributionTimeoutBlock = v2->_groupIDToInitialKeyMaterialDistributionTimeoutBlock;
    v2->_groupIDToInitialKeyMaterialDistributionTimeoutBlock = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    membersForGroup = v2->_membersForGroup;
    v2->_membersForGroup = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    membersLightweightStatusDict = v2->_membersLightweightStatusDict;
    v2->_membersLightweightStatusDict = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    participantsForGroup = v2->_participantsForGroup;
    v2->_participantsForGroup = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToTypeToParticipantsPushTokens = v2->_groupIDToTypeToParticipantsPushTokens;
    v2->_groupIDToTypeToParticipantsPushTokens = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    participantsInfoForGroup = v2->_participantsInfoForGroup;
    v2->_participantsInfoForGroup = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    endpointSubscriptionForGroup = v2->_endpointSubscriptionForGroup;
    v2->_endpointSubscriptionForGroup = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastKnownGroupIDToPushTokens = v2->_lastKnownGroupIDToPushTokens;
    v2->_lastKnownGroupIDToPushTokens = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastKnownAccountIDToPushTokens = v2->_lastKnownAccountIDToPushTokens;
    v2->_lastKnownAccountIDToPushTokens = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    participantsWaitingForKeyMaterials = v2->_participantsWaitingForKeyMaterials;
    v2->_participantsWaitingForKeyMaterials = v46;

    v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    participantsWaitingForStableKeyMaterials = v2->_participantsWaitingForStableKeyMaterials;
    v2->_participantsWaitingForStableKeyMaterials = v48;

    v50 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    participantsWaitingForInitialKeyMaterials = v2->_participantsWaitingForInitialKeyMaterials;
    v2->_participantsWaitingForInitialKeyMaterials = v50;

    v52 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingMasterKeyMaterials = v2->_pendingMasterKeyMaterials;
    v2->_pendingMasterKeyMaterials = v52;

    v54 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingStableKeyMaterials = v2->_pendingStableKeyMaterials;
    v2->_pendingStableKeyMaterials = v54;

    v56 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToResetKeyMaterialCacheTimer = v2->_groupIDToResetKeyMaterialCacheTimer;
    v2->_groupIDToResetKeyMaterialCacheTimer = v56;

    v58 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accountIDs = v2->_accountIDs;
    v2->_accountIDs = v58;

    v60 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fromURIs = v2->_fromURIs;
    v2->_fromURIs = v60;

    v62 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    encryptionSequenceNumbers = v2->_encryptionSequenceNumbers;
    v2->_encryptionSequenceNumbers = v62;

    v64 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToLastMemberAddDate = v2->_groupIDToLastMemberAddDate;
    v2->_groupIDToLastMemberAddDate = v64;

    uint64_t v66 = +[NSMutableArray array];
    preKeyChangeHandlers = v2->_preKeyChangeHandlers;
    v2->_preKeyChangeHandlers = (NSMutableArray *)v66;

    v2->_lock._os_unfair_lock_opaque = 0;
    v68 = +[IDSServerBag sharedInstance];
    v69 = [v68 objectForKey:@"ids-rtencryption-mkm-expire-duration"];

    if (v69)
    {
      v2->_unsigned int mkmExpireDuration = [v69 unsignedIntValue];
      v70 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int mkmExpireDuration = v2->_mkmExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v112 = mkmExpireDuration;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Got kIDSRTEncryptionMKMExpireDurationBagKey %u", buf, 8u);
      }
    }
    else
    {
      v2->_unsigned int mkmExpireDuration = 1200;
      v70 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_100714DF0();
      }
    }

    v72 = +[IDSServerBag sharedInstance];
    v73 = [v72 objectForKey:@"ids-rtencryption-mkm-roll-duration"];

    if (v73)
    {
      v2->_unsigned int mkmRollDuration = [v73 unsignedIntValue];
      v74 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int mkmRollDuration = v2->_mkmRollDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v112 = mkmRollDuration;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Got kIDSRTEncryptionMKMRollDurationBagKey %u", buf, 8u);
      }
    }
    else
    {
      v2->_unsigned int mkmRollDuration = 600;
      v74 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_100714D88();
      }
    }

    unsigned int v76 = IMGetDomainIntForKey();
    unsigned int v77 = v76;
    if (v76)
    {
      v2->_unsigned int mkmExpireDuration = v76;
      v2->_unsigned int mkmRollDuration = v76 >> 1;
      v78 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v79 = v2->_mkmRollDuration;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v112 = v77;
        *(_WORD *)&v112[4] = 1024;
        *(_DWORD *)&v112[6] = v79;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Got key duration value from user defaults write, set _mkmExpirationDuration: %u _mkmRollDuration: %u", buf, 0xEu);
      }
    }
    v80 = +[IDSServerBag sharedInstance];
    v81 = [v80 objectForKey:@"ids-rtencryption-prekey-expire-duration"];

    if (v81)
    {
      v2->_unsigned int prekeyExpireDuration = [v81 unsignedIntValue];
      v82 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int prekeyExpireDuration = v2->_prekeyExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v112 = prekeyExpireDuration;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Got kIDSRTEncryptionExpireDurationBagKey %u", buf, 8u);
      }
    }
    else
    {
      v2->_unsigned int prekeyExpireDuration = 3600;
      v82 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        sub_100714D20();
      }
    }

    v84 = +[IDSServerBag sharedInstance];
    v85 = [v84 objectForKey:@"ids-rtencryption-previous-prekey-expire-duration"];

    if (v85)
    {
      v2->_unsigned int previousPrekeyExpireDuration = [v85 unsignedIntValue];
      v86 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int previousPrekeyExpireDuration = v2->_previousPrekeyExpireDuration;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v112 = previousPrekeyExpireDuration;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Got kIDSRTEncryptionPreviousPrekeyExpireDurationBagKey %u", buf, 8u);
      }
    }
    else
    {
      v2->_unsigned int previousPrekeyExpireDuration = 420;
      v86 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        sub_100714CB8();
      }
    }

    v88 = +[IDSServerBag sharedInstance];
    v89 = [v88 objectForKey:@"ids-rtencryption-mkm-broadcast-enabled"];

    if (v89) {
      unsigned __int8 v90 = [v89 BOOLValue];
    }
    else {
      unsigned __int8 v90 = 1;
    }
    v2->_shouldBroadcastAllValidMkMs = v90;
    int v91 = IMGetDomainBoolForKeyWithDefaultValue();
    v92 = +[IDSServerBag sharedInstance];
    v93 = [v92 objectForKey:@"ids-rtencryption-mkm-over-qr-enabled-v2"];

    if (v93) {
      unsigned __int8 v94 = [v93 BOOLValue];
    }
    else {
      unsigned __int8 v94 = v91;
    }
    v2->_shouldSendMKMOverQR = v94;
    v95 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      if (v2->_shouldSendMKMOverQR) {
        CFStringRef v96 = @"enabled";
      }
      else {
        CFStringRef v96 = @"disabled";
      }
      unsigned int v97 = [v93 BOOLValue];
      CFStringRef v98 = @"NO";
      if (v97) {
        CFStringRef v99 = @"YES";
      }
      else {
        CFStringRef v99 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)v112 = v96;
      *(_WORD *)&v112[8] = 2112;
      CFStringRef v113 = v99;
      if (v91) {
        CFStringRef v98 = @"YES";
      }
      __int16 v114 = 2112;
      CFStringRef v115 = v98;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Sending MKM over QR %@ - serverBag: %@, defaults: %@", buf, 0x20u);
    }

    v2->_mkmAcknowledgementTimeout = sub_100198EB8(@"ids-rtencryption-mkm-ack-timeout", 30.0);
    v2->_preKeyRequestDelayDuration = sub_100198EB8(@"ids-rtencryption-prekey-req-delay-duration", 3.0);
    v100 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v101 = dispatch_queue_create("com.apple.ids.realtimeencryptioncontroller", v100);
    realtimeEncryptionQueue = v2->_realtimeEncryptionQueue;
    v2->_realtimeEncryptionQueue = (OS_dispatch_queue *)v101;

    int v103 = IMGetDomainBoolForKey();
    byte_100A4A900 = v103;
    if (v103)
    {
      v104 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        if (byte_100A4A900) {
          CFStringRef v105 = @"YES";
        }
        else {
          CFStringRef v105 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v112 = v105;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "forceKeyRecoveryLogic default %@ - the first incoming MKM will get dropped and we'll start the key recovery logic for the test...", buf, 0xCu);
      }
    }
    int v106 = IMGetDomainBoolForKeyWithDefaultValue();
    if ((_os_feature_enabled_impl() & 1) != 0 || v106)
    {
      v107 = [[_TtC17identityservicesd39IDSGlobalLinkP2PKeyNegotiatorController alloc] initWithIdentityProvider:v2 groupMetadataProvider:v2];
      p2pNegotiatorProvider = v2->_p2pNegotiatorProvider;
      v2->_p2pNegotiatorProvider = (IDSGlobalLinkP2PKeyNegotiatorProvider *)v107;
    }
  }
  return v2;
}

- (id)p2pNegotiatorProvider
{
  return self->_p2pNegotiatorProvider;
}

- (id)remotePushTokensForGroup:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:a3];
  if (v4)
  {
    v24 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    +[NSMutableArray array];
    v22 = v4;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v11 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "remotePushTokensForGroup: getting push token for %@", buf, 0xCu);
          }

          uint64_t v12 = [v10 participantPushToken];
          if (v12)
          {
            v13 = (void *)v12;
            v14 = [v10 participantPushToken];
            v15 = [v24 rawToken];
            unsigned __int8 v16 = [v14 isEqualToData:v15];

            if ((v16 & 1) == 0)
            {
              v17 = [v10 participantPushToken];
              v18 = +[IDSPushToken pushTokenWithData:v17];
              if (v18)
              {
                [v23 addObject:v18];
              }
              else
              {
                v19 = +[NSNull null];
                [v23 addObject:v19];
              }
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(lock);
    v4 = v22;
  }
  else
  {
    id v23 = &__NSArray0__struct;
  }

  return v23;
}

- (__SecKey)localPublicPreKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice publicIdentity];
}

- (__SecKey)localPrivatePreKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice fullIdentity];
}

- (__SecKey)previousLocalPublicPreKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice publicIdentity];
}

- (__SecKey)previousLocalPrivatePreKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice fullIdentity];
}

- (__SecKey)publicKeyForPushToken:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:a3];
  v4 = (__SecKey *)[v3 publicIdentity];

  return v4;
}

- (id)addPreKeyChangeHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  preKeyChangeHandlers = self->_preKeyChangeHandlers;
  id v6 = objc_retainBlock(v4);
  [(NSMutableArray *)preKeyChangeHandlers addObject:v6];

  os_unfair_lock_unlock(&self->_lock);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019934C;
  v10[3] = &unk_1009814F8;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = objc_retainBlock(v10);

  return v8;
}

- (void)notifyPreKeyChange
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_preKeyChangeHandlers copy];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (IDSDSessionController)sessionController
{
  id sessionController = self->_sessionController;
  if (sessionController)
  {
    id v3 = sessionController;
  }
  else
  {
    id v3 = +[IDSDSessionController sharedInstance];
  }

  return (IDSDSessionController *)v3;
}

- (id)_localDevicePushToken
{
  v2 = +[IDSPushHandler sharedInstance];
  id v3 = [v2 pushToken];
  id v4 = +[IDSPushToken pushTokenWithData:v3];

  return v4;
}

- (BOOL)_isUsingAccount:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(NSMutableDictionary *)self->_accountIDs allValues];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019968C;
  v8[3] = &unk_100984818;
  id v6 = v4;
  id v9 = v6;
  long long v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (id)_locked_ensureGroupMasterKeyMaterialCacheForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [(IDSGroupEncryptionController1 *)self sessionController];
    id v7 = [v6 sessionWithGroupID:v4];
    uint64_t v8 = [v7 destinations];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = +[NSSet set];
    }
    uint64_t v11 = v10;

    long long v12 = [IDSGroupMasterKeyMaterialCache alloc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100199834;
    v15[3] = &unk_100984840;
    v15[4] = self;
    uint64_t v13 = im_primary_queue();
    id v5 = [(IDSGroupMasterKeyMaterialCache *)v12 initWithIdentifier:v4 initialMembershipURIs:v11 automaticResetBlock:v15 queue:v13];

    [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_ensureGroupStableKeyMaterialCacheForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [[IDSGroupStableKeyMaterialCache alloc] initWithIdentifier:v4];
    [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)setAccount:(id)a3 fromURI:(id)a4 forGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    id v11 = a4;
    os_unfair_lock_lock(&self->_lock);
    if (![(IDSGroupEncryptionController1 *)self _isUsingAccount:v8])
    {
      long long v12 = im_primary_queue();
      char v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      unsigned __int8 v16 = sub_100199AD0;
      v17 = &unk_10097E440;
      id v18 = v8;
      v19 = self;
      dispatch_async(v12, &v14);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountIDs, "setObject:forKeyedSubscript:", v8, v10, v14, v15, v16, v17);
    [(NSMutableDictionary *)self->_fromURIs setObject:v11 forKeyedSubscript:v10];

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setAccount: added the accountID %@ for group %@", buf, 0x16u);
    }
  }
}

- (void)removeAccountForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_accountIDs setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_fromURIs setObject:0 forKeyedSubscript:v4];
    if (v5 && ![(IDSGroupEncryptionController1 *)self _isUsingAccount:v5])
    {
      id v6 = im_primary_queue();
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100199E94;
      v8[3] = &unk_10097E440;
      id v9 = v5;
      id v10 = self;
      dispatch_async(v6, v8);
    }
    os_unfair_lock_unlock(&self->_lock);
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removeAccountForGroup: removed the account for group %@", buf, 0xCu);
    }
  }
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  LOBYTE(v7) = a7;
  [(IDSGroupEncryptionController1 *)self _requestKeyMaterialForGroup:a3 sessionID:a4 toSpecificMembers:a5 shouldTrackDistribution:0 shouldIncludeCachedPeerKeyMaterial:1 requireMKM:a6 requireSKM:v7];
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  BYTE2(v4) = 0;
  LOWORD(v4) = 257;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:", a3, a4, 0, 0, 0, 0, v4);
}

- (void)requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 shouldGenerateMKM:(BOOL)a5
{
  BYTE2(v5) = 0;
  LOWORD(v5) = 1;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:", a3, a4, 0, 0, 0, a5, v5);
}

- (void)reliablyRequestKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  LOWORD(v4) = 257;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:requireMKM:requireSKM:isFirstSession:", a3, a4, 0, 1, 0, 1, v4);
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 shouldGenerateMKM:(BOOL)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10 isFirstSession:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  CFStringRef v20 = @"NO";
  BOOL obj = v13;
  BOOL v21 = !v13;
  BOOL v22 = v11;
  id v23 = v18;
  if (v21) {
    CFStringRef v24 = @"NO";
  }
  else {
    CFStringRef v24 = @"YES";
  }
  BOOL v136 = v12;
  if (v12) {
    CFStringRef v25 = @"YES";
  }
  else {
    CFStringRef v25 = @"NO";
  }
  if (v22) {
    CFStringRef v26 = @"YES";
  }
  else {
    CFStringRef v26 = @"NO";
  }
  if (a9) {
    CFStringRef v27 = @"YES";
  }
  else {
    CFStringRef v27 = @"NO";
  }
  if (a10) {
    CFStringRef v28 = @"YES";
  }
  else {
    CFStringRef v28 = @"NO";
  }
  if (a11) {
    CFStringRef v20 = @"YES";
  }
  id v140 = v19;
  +[NSString stringWithFormat:@"requestKeyMaterialForGroup %@ sessionID %@ shouldTrackDistribution %@ shouldIncludeCachedPeerKeyMaterial %@ shouldGenerateMKM: %@ requireMKM: %@ requireSKM: %@ toSepcificMembers %@ isFirstSession: %@", v17, v23, v24, v25, v26, v27, v28, v19, v20];
  v158 = _NSConcreteStackBlock;
  uint64_t v159 = 3221225472;
  v160 = sub_10019B1DC;
  v161 = &unk_10097E4D0;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v162 = v29;
  cut_dispatch_log_queue();
  v30 = [(IDSGroupEncryptionController1 *)self sessionController];
  uint64_t v31 = [v30 sessionWithUniqueID:v23];

  v149 = (void *)v31;
  if (v31)
  {
    v141 = self;
    id v137 = v17;
    v32 = +[IDSFoundationLog RealTimeEncryptionController];
    v33 = (void **)&IDSRegistrationPropertySupportsAVLess_ptr;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v168 = v27;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: requireMKM: %@", buf, 0xCu);
    }
    v138 = v23;

    v34 = v140;
    id v134 = v29;
    if (a9)
    {
      [(IDSGroupEncryptionController1 *)self cleanUpExpiredMasterKeyMaterial];
      p_os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&v141->_lock);
      v36 = v17;
      v37 = [(NSMutableDictionary *)v141->_groupIDToKeyMaterialCache objectForKeyedSubscript:v17];
      v38 = [v37 currentLocalMasterKeyMaterial];
      os_unfair_lock_unlock(&v141->_lock);
      v39 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v168 = v38;
        __int16 v169 = 2112;
        CFStringRef v170 = v26;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: masterKeyMaterial: %@ shouldGenerateMKM: %@", buf, 0x16u);
      }

      if (v38) {
        int v40 = v22;
      }
      else {
        int v40 = 1;
      }
      char v133 = v40;
      if (v40 == 1)
      {
        v41 = v141;
        [(IDSGroupEncryptionController1 *)v141 createKeyMaterialForGroup:v17 sessionID:v138];
        if (obj) {
          [(IDSGroupEncryptionController1 *)v141 _initializeParticipantsWaitingForInitialKeyMaterialsForGroup:v17];
        }
      }
      else
      {
        v41 = v141;
        if (a11)
        {
          os_unfair_lock_lock(p_lock);
          v132 = v38;
          v52 = [(__CFString *)v38 keyIndex];
          v53 = [v52 UUIDString];
          unsigned __int8 v54 = [v37 hasClientReceivedMasterKeyIdentifier:v53];

          if ((v54 & 1) == 0)
          {
            v55 = [(__CFString *)v132 keyIndex];
            v56 = [v55 UUIDString];
            [v37 noteClientReceiptOfMasterKeyIdentifier:v56];
          }
          v57 = [v37 cachedMasterKeyMaterialCollection];
          os_unfair_lock_unlock(p_lock);
          v58 = +[IDSFoundationLog RealTimeEncryptionController];
          BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
          if (v54)
          {
            if (v59)
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v168 = v132;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: no need to send local MKM %@ to AVC", buf, 0xCu);
            }
          }
          else
          {
            if (v59)
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v168 = v132;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: send local MKM %@ to AVC", buf, 0xCu);
            }

            [v149 recvKeyMaterial:v132];
            [(__CFString *)v132 setIsSentToClient:1];
          }
          long long v156 = 0u;
          long long v157 = 0u;
          long long v154 = 0u;
          long long v155 = 0u;
          v131 = v57;
          obja = [v57 masterKeyMaterials];
          id v60 = [obja countByEnumeratingWithState:&v154 objects:v166 count:16];
          if (v60)
          {
            id v61 = v60;
            uint64_t v62 = *(void *)v155;
            v144 = v37;
            do
            {
              for (i = 0; i != v61; i = (char *)i + 1)
              {
                if (*(void *)v155 != v62) {
                  objc_enumerationMutation(obja);
                }
                v64 = *(__CFString **)(*((void *)&v154 + 1) + 8 * i);
                if (([(__CFString *)v64 isGeneratedLocally] & 1) == 0)
                {
                  v65 = v33;
                  os_unfair_lock_lock(p_lock);
                  uint64_t v66 = [(__CFString *)v64 keyIndex];
                  v67 = [v66 UUIDString];
                  v68 = v37;
                  unsigned __int8 v69 = [v37 hasClientReceivedMasterKeyIdentifier:v67];

                  if (v69)
                  {
                    os_unfair_lock_unlock(p_lock);
                    v33 = v65;
                    v70 = [v65[288] RealTimeEncryptionController];
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v168 = v64;
                      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: no need to send remote MKM %@ to AVC", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v71 = [(__CFString *)v64 keyIndex];
                    v72 = [v71 UUIDString];
                    [v68 noteClientReceiptOfMasterKeyIdentifier:v72];

                    os_unfair_lock_unlock(p_lock);
                    v33 = v65;
                    v73 = [v65[288] RealTimeEncryptionController];
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v168 = v64;
                      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: send remote MKM %@ to AVC", buf, 0xCu);
                    }

                    [v149 recvKeyMaterial:v64];
                    [(__CFString *)v64 setIsSentToClient:1];
                  }
                  v37 = v144;
                }
              }
              id v61 = [obja countByEnumeratingWithState:&v154 objects:v166 count:16];
            }
            while (v61);
          }

          v36 = v137;
          v41 = v141;
          v38 = v132;
        }
      }

      v34 = v140;
    }
    else
    {
      char v133 = 0;
      v36 = v17;
      v41 = self;
    }
    if (a10)
    {
      v74 = &v41->_lock;
      os_unfair_lock_lock(&v41->_lock);
      v75 = [(NSMutableDictionary *)v41->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v36];
      unsigned int v76 = [v75 currentLocalStableKeyMaterial];

      unsigned int v77 = [(NSMutableDictionary *)v41->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v36];
      v78 = [(NSMutableDictionary *)v41->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v36];
      unsigned int v145 = [v78 sentToRemotes] ^ 1;

      os_unfair_lock_unlock(&v41->_lock);
      if (v76)
      {
        if (a11)
        {
          os_unfair_lock_lock(&v41->_lock);
          v142 = v76;
          unsigned int v79 = [(__CFString *)v76 keyIndex];
          v80 = [v79 UUIDString];
          unsigned __int8 v81 = [v77 hasClientReceivedStableKeyIdentifier:v80];

          if ((v81 & 1) == 0)
          {
            v82 = [(__CFString *)v142 keyIndex];
            v83 = [v82 UUIDString];
            [v77 noteClientReceiptOfStableKeyIdentifier:v83];
          }
          v84 = [v77 cachedStableKeyMaterialCollection];
          os_unfair_lock_unlock(v74);
          v85 = [v33[288] RealTimeEncryptionController];
          BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
          if (v81)
          {
            if (v86)
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v168 = v142;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: no need to send local SKM %@ to framework", buf, 0xCu);
            }
          }
          else
          {
            if (v86)
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v168 = v142;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: send local SKM %@ to framework", buf, 0xCu);
            }

            v88 = [(__CFString *)v142 dictionaryRepresentation];
            v165 = v88;
            v89 = +[NSArray arrayWithObjects:&v165 count:1];
            [v149 recvStableKeyMaterialForFrameworkCache:v89];

            [(__CFString *)v142 setIsSentToClient:1];
          }
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          v135 = v84;
          unsigned __int8 v90 = [v84 stableKeyMaterials];
          id v91 = [v90 countByEnumeratingWithState:&v150 objects:v164 count:16];
          if (v91)
          {
            id v92 = v91;
            uint64_t v93 = *(void *)v151;
            do
            {
              for (j = 0; j != v92; j = (char *)j + 1)
              {
                if (*(void *)v151 != v93) {
                  objc_enumerationMutation(v90);
                }
                v95 = *(__CFString **)(*((void *)&v150 + 1) + 8 * (void)j);
                if (([(__CFString *)v95 isGeneratedLocally] & 1) == 0)
                {
                  os_unfair_lock_lock(v74);
                  CFStringRef v96 = [(__CFString *)v95 keyIndex];
                  unsigned int v97 = [v96 UUIDString];
                  unsigned __int8 v98 = [v77 hasClientReceivedStableKeyIdentifier:v97];

                  if (v98)
                  {
                    os_unfair_lock_unlock(v74);
                    CFStringRef v99 = +[IDSFoundationLog RealTimeEncryptionController];
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v168 = v95;
                      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: no need to send remote SKM %@ to framework", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v100 = [(__CFString *)v95 keyIndex];
                    dispatch_queue_t v101 = [v100 UUIDString];
                    [v77 noteClientReceiptOfStableKeyIdentifier:v101];

                    os_unfair_lock_unlock(v74);
                    v102 = +[IDSFoundationLog RealTimeEncryptionController];
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v168 = v95;
                      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: send remote SKM %@ to framework", buf, 0xCu);
                    }

                    int v103 = [(__CFString *)v95 dictionaryRepresentation];
                    v163 = v103;
                    v104 = +[NSArray arrayWithObjects:&v163 count:1];
                    [v149 recvStableKeyMaterialForFrameworkCache:v104];

                    [(__CFString *)v95 setIsSentToClient:1];
                  }
                }
              }
              id v92 = [v90 countByEnumeratingWithState:&v150 objects:v164 count:16];
            }
            while (v92);
          }

          v36 = v137;
          v41 = v141;
          unsigned int v76 = v142;
          v33 = (void **)&IDSRegistrationPropertySupportsAVLess_ptr;
        }
      }
      else
      {
        [(IDSGroupEncryptionController1 *)v41 createStableKeyMaterialAndSendToFrameworkForGroup:v36 sessionID:v138];
      }

      v34 = v140;
      char v87 = v145;
    }
    else
    {
      char v87 = 0;
    }
    v50 = [(IDSGroupEncryptionController1 *)v41 _getSetofStandardParticipantsForGroup:v36];
    CFStringRef v105 = [v33[288] RealTimeEncryptionController];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v168 = v50;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: standardDestinationSet: %@", buf, 0xCu);
    }

    int v106 = [v33[288] RealTimeEncryptionController];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      v107 = +[NSSet setWithArray:v34];
      *(_DWORD *)buf = 138412290;
      CFStringRef v168 = v107;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: givenDestinationSet: %@", buf, 0xCu);
    }
    v108 = &v41->_lock;
    os_unfair_lock_lock(&v41->_lock);
    v109 = [(NSMutableDictionary *)v41->_participantsForGroup objectForKeyedSubscript:v36];
    id v110 = [v109 copy];
    v111 = +[NSMutableSet setWithArray:v110];

    [v111 minusSet:v50];
    os_unfair_lock_unlock(v108);
    uint64_t v112 = [(IDSGroupEncryptionController1 *)v141 _localDevicePushToken];
    id v23 = v138;
    if (v112)
    {
      [(__CFString *)v50 removeObject:v112];
      [v111 removeObject:v112];
    }
    objb = (void *)v112;
    if (a9)
    {
      CFStringRef v113 = (__CFString *)[(__CFString *)v50 mutableCopy];
      id v114 = [v111 mutableCopy];
      if ((v133 & 1) == 0)
      {
        CFStringRef v115 = v111;
        v116 = +[NSSet setWithArray:v34];
        [(__CFString *)v113 intersectSet:v116];
        [v114 intersectSet:v116];
        v117 = [v33[288] RealTimeEncryptionController];
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v168 = v116;
          _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: givenDestinationSet for MKM: %@", buf, 0xCu);
        }

        v111 = v115;
      }
      if ([(__CFString *)v113 count]) {
        v118 = v113;
      }
      else {
        v118 = v50;
      }
      v119 = [(__CFString *)v118 allObjects];
      if ([v114 count]) {
        v120 = v114;
      }
      else {
        v120 = v111;
      }
      v121 = [v120 allObjects];
      v143 = v111;
      v139 = v113;
      v122 = v119;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"requestKeyMaterialForGroup standardParticipantsDestinations: %lu %@\nlightweightParticipantsDestinations: %lu %@\n\nstandardDestinationSet: %lu %@\ngivenStandardDestinations: %lu %@\n\nlightweightDestinationSet: %lu %@\ngivenLightweightDestinations: %lu %@", [v119 count], v119, objc_msgSend(v121, "count"), v121, -[__CFString count](v50, "count"), v50, -[__CFString count](v113, "count"), v113, objc_msgSend(v111, "count"), v111, objc_msgSend(v114, "count"), v114);
      id v123 = (id)objc_claimAutoreleasedReturnValue();
      cut_dispatch_log_queue();
      v36 = v137;
      id v23 = v138;
      [(IDSGroupEncryptionController1 *)v141 _sendKeyMaterialsToGroup:v137 sessionID:v138 toSpecificMembers:v122 shouldIncludeCachedPeerKeyMaterial:v136 requireMKM:1 requireSKM:a10];
      if ([v121 count])
      {
        [(IDSGroupEncryptionController1 *)v141 _sendKeyMaterialsToGroup:v137 sessionID:v138 toSpecificMembers:v121 shouldIncludeCachedPeerKeyMaterial:0 requireMKM:0 requireSKM:1];
        v34 = v140;
        v51 = v134;
      }
      else
      {
        v129 = v122;
        v130 = +[IDSFoundationLog RealTimeEncryptionController];
        v51 = v134;
        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "_requestKeyMaterialForGroup: skipping _sendKeyMaterialsToGroup for lightweight participants because there are no lightweight participants", buf, 2u);
        }

        v34 = v140;
        v122 = v129;
      }

      v128 = v143;
      v127 = v139;
    }
    else
    {
      if ((v87 & 1) == 0)
      {
        v124 = +[NSSet setWithArray:v34];
        if ([(__CFString *)v124 count])
        {
          [(__CFString *)v50 intersectSet:v124];
          [v111 intersectSet:v124];
        }
        v125 = v111;
        v126 = [v33[288] RealTimeEncryptionController];
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v168 = v124;
          _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "requestKeyMaterialForGroup: givenDestinationSet for SKM: %@", buf, 0xCu);
        }

        v111 = v125;
      }
      v127 = [(__CFString *)v50 setByAddingObjectsFromSet:v111];
      id v114 = [v127 allObjects];
      [(IDSGroupEncryptionController1 *)v141 _sendKeyMaterialsToGroup:v36 sessionID:v138 toSpecificMembers:v114 shouldIncludeCachedPeerKeyMaterial:v136 requireMKM:0 requireSKM:a10];
      v128 = v111;
      v51 = v134;
    }
  }
  else
  {
    groupIDToKeyMaterialCache = self->_groupIDToKeyMaterialCache;
    p_groupIDToKeyMaterialCache = (id *)&self->_groupIDToKeyMaterialCache;
    v44 = [(NSMutableDictionary *)groupIDToKeyMaterialCache objectForKeyedSubscript:v17];
    [v44 setNextLocalMasterKeyMaterial:0];

    v45 = [*p_groupIDToKeyMaterialCache objectForKeyedSubscript:v17];
    [v45 setCurrentLocalMasterKeyMaterial:0];

    v46 = [p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17];
    [v46 setCurrentLocalStableKeyMaterial:0];

    v47 = [p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17];
    [v47 setPreviousLocalStableKeyMaterial:0];

    v48 = [p_groupIDToKeyMaterialCache[1] objectForKeyedSubscript:v17];
    [v48 setSentToRemotes:0];

    v49 = +[IDSFoundationLog RealTimeEncryptionController];
    v36 = v17;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = (__CFString *)v49;
      sub_100714E58();
      v34 = v140;
    }
    else
    {
      v34 = v140;
      v50 = (__CFString *)v49;
    }
    v51 = v29;
  }
}

- (id)_getSetofStandardParticipantsForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 objectForKeyedSubscript:&off_1009D1770];
  id v8 = [v7 copy];
  id v9 = +[NSMutableSet setWithArray:v8];

  id v10 = [(NSMutableDictionary *)self->_membersLightweightStatusDict objectForKeyedSubscript:v4];
  id v11 = [v10 copy];

  BOOL v12 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v4];
  id v13 = [v12 copy];

  os_unfair_lock_unlock(p_lock);
  id v14 = objc_alloc_init((Class)NSMutableSet);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10019B710;
  v40[3] = &unk_100984868;
  id v15 = v9;
  id v41 = v15;
  id v16 = v11;
  id v42 = v16;
  id v17 = v14;
  id v43 = v17;
  [v13 enumerateObjectsUsingBlock:v40];
  if (![v17 count])
  {
    id v32 = v17;
    id v33 = v15;
    id v34 = v13;
    id v35 = v4;
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = v16;
    id v20 = [v19 countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          CFStringRef v26 = [v19 objectForKeyedSubscript:v24];
          if (isKindOfClass)
          {
            CFStringRef v27 = +[IDSURI URIWithPrefixedURI:v24];
            [v18 setObject:v26 forKeyedSubscript:v27];
          }
          else
          {
            [v18 setObject:v26 forKeyedSubscript:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v21);
    }

    CFStringRef v28 = +[IDSFoundationLog RealTimeEncryptionController];
    id v15 = v33;
    id v13 = v34;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v45 = v33;
      __int16 v46 = 2112;
      id v47 = v18;
      __int16 v48 = 2112;
      id v49 = v34;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "_getSetofStandardParticipantsForGroup - standardDestinationSet: %@, lightweightStatusDict:%@, participantInfo: %@", buf, 0x20u);
    }

    id v4 = v35;
    id v17 = v32;
  }
  id v29 = v43;
  id v30 = v17;

  return v30;
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9 isFirstSession:(BOOL)a10
{
  *(_WORD *)((char *)&v10 + 1) = __PAIR16__(a10, a9);
  LOBYTE(v10) = a8;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:", a3, a4, a5, a6, a7, 0, v10);
}

- (void)_requestKeyMaterialForGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldTrackDistribution:(BOOL)a6 shouldIncludeCachedPeerKeyMaterial:(BOOL)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9
{
  BYTE2(v9) = 0;
  BYTE1(v9) = a9;
  LOBYTE(v9) = a8;
  -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:", a3, a4, a5, a6, a7, 0, v9);
}

- (id)_pruneInvalidAndLocalPushTokensFromTokens:(id)a3
{
  id v4 = [a3 mutableCopy];
  uint64_t v5 = +[NSNull null];
  [v4 removeObject:v5];

  id v6 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice pushToken];
  [v4 removeObject:v6];

  return v4;
}

- (id)_pruneLightweightParticipantsForGroupID:(id)a3 forTokens:(id)a4
{
  groupIDToTypeToParticipantsPushTokens = self->_groupIDToTypeToParticipantsPushTokens;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:a3];
  id v8 = [v7 objectForKeyedSubscript:&off_1009D1788];
  id v9 = [v8 copy];

  id v10 = [v6 mutableCopy];
  if ([v9 count]) {
    [v10 removeObjectsInArray:v9];
  }

  return v10;
}

- (void)_initializeParticipantsWaitingForInitialKeyMaterialsForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double mkmAcknowledgementTimeout = self->_mkmAcknowledgementTimeout;
  uint64_t v7 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v4];
  id v8 = [(IDSGroupEncryptionController1 *)self _pruneInvalidAndLocalPushTokensFromTokens:v7];

  id v9 = [(IDSGroupEncryptionController1 *)self _pruneLightweightParticipantsForGroupID:v4 forTokens:v8];

  id v10 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v4;
    __int16 v23 = 2112;
    double v24 = *(double *)&v9;
    __int16 v25 = 2048;
    double v26 = mkmAcknowledgementTimeout;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing list of participants waiting for initial key materials { groupID: %@, destinations: %@, timeout: %f }", buf, 0x20u);
  }

  if ([v9 count] && mkmAcknowledgementTimeout > 2.22044605e-16)
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithArray:v9];
    [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials setObject:v11 forKeyedSubscript:v4];

    BOOL v12 = [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock objectForKeyedSubscript:v4];
    id v13 = v12;
    if (v12) {
      dispatch_block_cancel(v12);
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019BD60;
    block[3] = &unk_100984890;
    block[4] = self;
    id v14 = v4;
    id v20 = v14;
    objc_copyWeak(&v21, (id *)buf);
    id v15 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);

    id v16 = objc_retainBlock(v15);
    [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock setObject:v16 forKeyedSubscript:v14];

    dispatch_time_t v17 = dispatch_walltime(0, (uint64_t)(mkmAcknowledgementTimeout * 1000000000.0));
    id v18 = im_primary_queue();
    dispatch_after(v17, v18, v15);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v15 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v23 = 2048;
      double v24 = mkmAcknowledgementTimeout;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not setting initial key material distribution timeout { destinations: %@, timeout: %f }", buf, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_noteKeyMaterialDidSendToDestination:(id)a3 groupID:(id)a4 withSuccess:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock objectForKeyedSubscript:v9];
  id v11 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v9];
  id v12 = [v11 count];

  if (v12)
  {
    if (v5)
    {
      id v13 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v9];
      [v13 removeObject:v8];

      id v14 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v9];
        id v16 = objc_retainBlock(v10);
        int v22 = 138413058;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        CFStringRef v27 = v15;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed entry from list of participants waiting for initial key materials { groupID: %@, destination: %@, remainingDestinations: %@, timeoutBlock: %@ }", (uint8_t *)&v22, 0x2Au);
      }
      dispatch_time_t v17 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v9];
      id v18 = [v17 count];

      if (!v18)
      {
        [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials setObject:0 forKeyedSubscript:v9];
        if (v10)
        {
          dispatch_block_cancel(v10);
LABEL_12:
          [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock setObject:0 forKeyedSubscript:v9];
        }
      }
    }
    else
    {
      id v19 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v9];
        id v21 = objc_retainBlock(v10);
        int v22 = 138413058;
        id v23 = v9;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        CFStringRef v27 = v20;
        __int16 v28 = 2112;
        id v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to send to participant waiting for initial key materials { groupID: %@, destination: %@, remainingDestinations: %@, timeoutBlock: %@ }", (uint8_t *)&v22, 0x2Au);
      }
      [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials setObject:0 forKeyedSubscript:v9];
      if (v10)
      {
        v10[2](v10);
        goto LABEL_12;
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_noteKeyMaterialNotNeededForDestination:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock objectForKeyedSubscript:v7];
  id v9 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v7];
  id v10 = [v9 count];

  if (v10)
  {
    id v11 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v7];
    [v11 removeObject:v6];

    id v12 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v7];
      id v14 = objc_retainBlock(v8);
      int v17 = 138413058;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      int v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed unneeded entry from list of participants waiting for initial key materials { groupID: %@, destination: %@, remainingDestinations: %@, timeoutBlock: %@ }", (uint8_t *)&v17, 0x2Au);
    }
    id v15 = [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:v7];
    id v16 = [v15 count];

    if (!v16)
    {
      [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials setObject:0 forKeyedSubscript:v7];
      if (v8)
      {
        dispatch_block_cancel(v8);
        [(NSMutableDictionary *)self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock setObject:0 forKeyedSubscript:v7];
      }
    }
  }
}

- (void)_sendRenewedPrekeysToGroups
{
  id v3 = [(IDSGroupEncryptionController1 *)self sessionController];
  id v4 = [v3 groupSessionGroupIDs];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v25;
    id v10 = &IDSRegistrationPropertySupportsAVLess_ptr;
    *(void *)&long long v7 = 138412802;
    long long v22 = v7;
    do
    {
      id v11 = 0;
      id v23 = v8;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
        id v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantsForGroup, "objectForKeyedSubscript:", v12, v22);
        id v14 = [(IDSGroupEncryptionController1 *)self sessionController];
        id v15 = [v14 sessionWithGroupID:v12];

        if (v15 && [v13 count])
        {
          id v16 = [v10[288] RealTimeEncryptionController];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            [v15 uniqueID];
            uint64_t v17 = v9;
            id v18 = v5;
            v20 = __int16 v19 = v10;
            *(_DWORD *)buf = v22;
            uint64_t v29 = v12;
            __int16 v30 = 2112;
            uint64_t v31 = v20;
            __int16 v32 = 2112;
            id v33 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_sendRenewedPrekeysToGroups: group %@, session %@: %@", buf, 0x20u);

            id v10 = v19;
            id v5 = v18;
            uint64_t v9 = v17;
            id v8 = v23;
          }

          __int16 v21 = [v15 uniqueID];
          [(IDSGroupEncryptionController1 *)self sendPublicKeyToGroup:v12 sessionID:v21];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v8);
  }
}

- (void)_dispatchRenewPrekeyTimer
{
  id v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int prekeyExpireDuration = self->_prekeyExpireDuration;
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = prekeyExpireDuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_dispatchRenewPrekeyTimer is called. We'll renew prekeys in %d", buf, 8u);
  }

  dispatch_time_t v5 = dispatch_walltime(0, 1000000000 * self->_prekeyExpireDuration);
  id v6 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019C6E0;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_after(v5, v6, block);
}

- (void)_sendKeyRecoveryRequestForPendingKeys:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5 forDevice:(id)a6
{
  BOOL v58 = a4;
  BOOL v59 = a5;
  id v7 = a3;
  id v8 = (__CFString *)a6;
  unsigned int v9 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    if (v58) {
      CFStringRef v11 = @"YES";
    }
    else {
      CFStringRef v11 = @"NO";
    }
    if (v59) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    *(_DWORD *)buf = 138413314;
    CFStringRef v84 = v11;
    id v8 = v10;
    __int16 v85 = 2112;
    CFStringRef v86 = v12;
    __int16 v87 = 2112;
    v88 = v10;
    __int16 v89 = 2048;
    id v90 = [v7 count];
    __int16 v91 = 2112;
    id v92 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_sendKeyRecoveryRequestForPendingKeys: requireMKM: %@, requireSKM: %@, pushToken: %@ pendingKeyMaterialsForRecovery: count: %lu, %@", buf, 0x34u);
  }

  if (v8 && ([v7 objectForKey:v8], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = v13;
    id v15 = v8;
    id v16 = [v13 objectForKeyedSubscript:IDSGroupSessionMessagesFromIDKey];
    id v17 = [v16 copy];

    id v18 = [v14 objectForKeyedSubscript:IDSGroupSessionMessagesGroupIDKey];
    id v19 = [v18 copy];

    id v20 = [v14 objectForKeyedSubscript:IDSDSessionMessageSessionID];
    id v21 = [v20 copy];

    long long v22 = [v14 objectForKeyedSubscript:IDSRealTimeEncryptionParticipantID];
    id v23 = [v22 copy];

    long long v24 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v84 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_sendKeyRecoveryRequestForPendingKeys: send key recovery request to: %@", buf, 0xCu);
    }

    long long v25 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019CDB4;
    block[3] = &unk_1009848B8;
    block[4] = self;
    v75 = v15;
    id v76 = v17;
    id v77 = v23;
    id v78 = v19;
    id v79 = v21;
    BOOL v80 = v58;
    BOOL v81 = v59;
    id v26 = v21;
    id v27 = v19;
    id v28 = v23;
    id v29 = v17;
    dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v25, v30);

    id v8 = v15;
  }
  else
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v52 = v7;
    id v14 = v7;
    id v61 = [v14 countByEnumeratingWithState:&v70 objects:v82 count:16];
    if (v61)
    {
      v51 = v8;
      uint64_t v60 = *(void *)v71;
      uint64_t v56 = IDSGroupSessionMessagesFromIDKey;
      uint64_t v55 = IDSGroupSessionMessagesGroupIDKey;
      uint64_t v54 = IDSDSessionMessageSessionID;
      uint64_t v53 = IDSRealTimeEncryptionParticipantID;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v71 != v60) {
            objc_enumerationMutation(v14);
          }
          __int16 v32 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          id v33 = objc_msgSend(v32, "copy", v51);
          id v34 = [v14 objectForKey:v32];
          id v35 = v34;
          if (v34)
          {
            long long v36 = [v34 objectForKeyedSubscript:v56];
            id v37 = [v36 copy];

            long long v38 = [v35 objectForKeyedSubscript:v55];
            id v39 = [v38 copy];

            int v40 = [v35 objectForKeyedSubscript:v54];
            id v41 = [v40 copy];

            id v42 = [v35 objectForKeyedSubscript:v53];
            id v43 = [v42 copy];

            im_primary_queue();
            id v45 = v44 = v14;
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10019CDF0;
            v62[3] = &unk_1009848B8;
            v62[4] = self;
            id v63 = v33;
            id v64 = v37;
            id v65 = v43;
            id v66 = v39;
            id v67 = v41;
            BOOL v68 = v58;
            BOOL v69 = v59;
            id v46 = v41;
            id v47 = v39;
            id v48 = v43;
            id v49 = v37;
            dispatch_block_t v50 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v62);
            dispatch_async(v45, v50);

            id v14 = v44;
          }
        }
        id v61 = [v14 countByEnumeratingWithState:&v70 objects:v82 count:16];
      }
      while (v61);
      id v8 = v51;
      id v7 = v52;
    }
  }
}

- (void)_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6
{
  BOOL v7 = a4;
  LODWORD(v8) = a3;
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_realtimeEncryptionQueue);
  os_unfair_lock_lock(&self->_lock);
  if (!v8) {
    goto LABEL_8;
  }
  CFStringRef v12 = [(NSMutableDictionary *)self->_pendingMasterKeyMaterials allKeys];
  id v13 = [v12 count];

  if (!v13)
  {
    [(NSMutableDictionary *)self->_groupIDToMKMRecoveryRetryCount setObject:&off_1009D17A0 forKeyedSubscript:v11];
    id v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - recovered all _pendingMasterKeyMaterials!", buf, 2u);
    }

LABEL_8:
    int v15 = 0;
    id v14 = 0;
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  id v14 = [(NSMutableDictionary *)self->_pendingMasterKeyMaterials copy];
  int v15 = 1;
  if (!v7) {
    goto LABEL_14;
  }
LABEL_9:
  id v17 = [(NSMutableDictionary *)self->_pendingStableKeyMaterials allKeys];
  id v18 = [v17 count];

  if (v18)
  {
    id v60 = [(NSMutableDictionary *)self->_pendingStableKeyMaterials copy];
    int v19 = 1;
    goto LABEL_15;
  }
  [(NSMutableDictionary *)self->_groupIDToSKMRecoveryRetryCount setObject:&off_1009D17A0 forKeyedSubscript:v11];
  id v20 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - recovered all _pendingStableKeyMaterials!", buf, 2u);
  }

LABEL_14:
  id v60 = 0;
  int v19 = 0;
LABEL_15:
  id v21 = [(NSMutableDictionary *)self->_groupIDToMKMRecoveryRetryCount objectForKeyedSubscript:v11];
  unsigned int v59 = [v21 unsignedCharValue];

  long long v22 = [(NSMutableDictionary *)self->_groupIDToSKMRecoveryRetryCount objectForKeyedSubscript:v11];
  unsigned int v58 = [v22 unsignedCharValue];

  os_unfair_lock_unlock(&self->_lock);
  if ((v15 | v19) == 1)
  {
    id v23 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = @"NO";
      *(_DWORD *)buf = 138413826;
      id v72 = v10;
      if (v15) {
        CFStringRef v25 = @"YES";
      }
      else {
        CFStringRef v25 = @"NO";
      }
      CFStringRef v74 = v25;
      __int16 v73 = 2112;
      if (v19) {
        CFStringRef v24 = @"YES";
      }
      __int16 v75 = 2112;
      CFStringRef v76 = v24;
      __int16 v77 = 2112;
      id v78 = v14;
      __int16 v79 = 1024;
      unsigned int v80 = v59;
      __int16 v81 = 2112;
      id v82 = v60;
      __int16 v83 = 1024;
      unsigned int v84 = v58;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - pushtoken: %@, needMKMRecoveryRequest: %@, needSKMRecoveryRequest: %@, current pendingMasterKeyMaterials %@, MKMRecoveryRetryCount %u, current pendingStableKeyMaterials: %@, SKMRecoveryRetryCount: %u", buf, 0x40u);
    }

    if (v15 & v19)
    {
      if (v10)
      {
        [(IDSGroupEncryptionController1 *)self _sendKeyRecoveryRequestForPendingKeys:v14 requireMKM:1 requireSKM:1 forDevice:v10];
        char v26 = v59;
      }
      else
      {
        char v53 = (char)v8;
        BOOL v54 = v7;
        uint64_t v55 = self;
        id v57 = v11;
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v31 = (__CFString *)[v14 copy];
        __int16 v32 = (__CFString *)[v60 copy];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v56 = v14;
        id v33 = v14;
        id v34 = [v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v67;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v67 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8 * i);
              id v39 = [v60 objectForKey:v38];

              if (v39)
              {
                int v40 = [v33 objectForKeyedSubscript:v38];
                id v41 = [v40 copy];
                [v8 setObject:v41 forKeyedSubscript:v38];

                [(__CFString *)v31 removeObjectForKey:v38];
                [(__CFString *)v32 removeObjectForKey:v38];
              }
            }
            id v35 = [v33 countByEnumeratingWithState:&v66 objects:v70 count:16];
          }
          while (v35);
        }

        id v42 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v72 = v8;
          __int16 v73 = 2112;
          CFStringRef v74 = v31;
          __int16 v75 = 2112;
          CFStringRef v76 = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - commonKeyMaterialsForRecovery: %@, MKMRecoveryDictionary: %@, SKMRecoveryDictionary: %@", buf, 0x20u);
        }

        self = v55;
        [(IDSGroupEncryptionController1 *)v55 _sendKeyRecoveryRequestForPendingKeys:v8 requireMKM:1 requireSKM:1 forDevice:0];
        LOBYTE(v7) = v54;
        char v26 = v59;
        if (v31 && [(__CFString *)v31 count]) {
          [(IDSGroupEncryptionController1 *)v55 _sendKeyRecoveryRequestForPendingKeys:v31 requireMKM:1 requireSKM:0 forDevice:0];
        }
        id v10 = 0;
        id v14 = v56;
        if (v32 && [(__CFString *)v32 count]) {
          [(IDSGroupEncryptionController1 *)v55 _sendKeyRecoveryRequestForPendingKeys:v32 requireMKM:0 requireSKM:1 forDevice:0];
        }

        id v11 = v57;
        LOBYTE(v8) = v53;
      }
      unsigned __int8 v27 = v26 + 1;
      id v43 = +[NSNumber numberWithUnsignedChar:v27];
      [(NSMutableDictionary *)self->_groupIDToMKMRecoveryRetryCount setObject:v43 forKeyedSubscript:v11];

      unsigned __int8 v29 = v58 + 1;
      id v44 = +[NSNumber numberWithUnsignedChar:(v58 + 1)];
      [(NSMutableDictionary *)self->_groupIDToSKMRecoveryRetryCount setObject:v44 forKeyedSubscript:v11];
    }
    else if (v15)
    {
      unsigned __int8 v27 = v59 + 1;
      id v28 = +[NSNumber numberWithUnsignedChar:(v59 + 1)];
      [(NSMutableDictionary *)self->_groupIDToMKMRecoveryRetryCount setObject:v28 forKeyedSubscript:v11];

      [(IDSGroupEncryptionController1 *)self _sendKeyRecoveryRequestForPendingKeys:v14 requireMKM:1 requireSKM:0 forDevice:v10];
      unsigned __int8 v29 = v58;
    }
    else
    {
      if (!v19)
      {
        id v47 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v48 = "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - doesn't needMKMRecoveryRequest or needSKMRecoveryRequest";
          id v49 = v47;
          uint32_t v50 = 2;
          goto LABEL_58;
        }
LABEL_59:

        goto LABEL_60;
      }
      unsigned __int8 v29 = v58 + 1;
      dispatch_block_t v30 = +[NSNumber numberWithUnsignedChar:(v58 + 1)];
      [(NSMutableDictionary *)self->_groupIDToSKMRecoveryRetryCount setObject:v30 forKeyedSubscript:v11];

      [(IDSGroupEncryptionController1 *)self _sendKeyRecoveryRequestForPendingKeys:v14 requireMKM:0 requireSKM:1 forDevice:v10];
      unsigned __int8 v27 = v59;
    }
    unsigned __int8 v45 = v29;
    if (v27 > v29) {
      unsigned __int8 v45 = v27;
    }
    unsigned __int8 v46 = v45 + 1;
    if (v46 == 3)
    {
      [(NSMutableDictionary *)self->_groupIDToMKMRecoveryRetryCount setObject:&off_1009D17A0 forKeyedSubscript:v11];
      [(NSMutableDictionary *)self->_groupIDToIsKeyMaterialRecoveryRunning setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
      [(NSMutableDictionary *)self->_groupIDToSKMRecoveryRetryCount setObject:&off_1009D17A0 forKeyedSubscript:v11];
      id v47 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v72) = 3;
        id v48 = "_doCheckPendingKeyMaterialsAndSendKeyRecoveryRequestForMKM - tried %d. Reset the retryCount";
        id v49 = v47;
        uint32_t v50 = 8;
LABEL_58:
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
        goto LABEL_59;
      }
      goto LABEL_59;
    }
    dispatch_time_t v51 = dispatch_walltime(0, 3000000000 * v46 + 3000000000);
    realtimeEncryptionQueue = self->_realtimeEncryptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019D658;
    block[3] = &unk_1009848E0;
    block[4] = self;
    char v64 = (char)v8;
    BOOL v65 = v7;
    id v62 = v10;
    id v63 = v11;
    dispatch_after(v51, realtimeEncryptionQueue, block);
  }
  else
  {
    [(NSMutableDictionary *)self->_groupIDToIsKeyMaterialRecoveryRunning setObject:&__kCFBooleanFalse forKeyedSubscript:v11];
  }
LABEL_60:
}

- (void)_startKeyRecoveryForMKM:(BOOL)a3 forSKM:(BOOL)a4 forDevice:(id)a5 forGroupID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_realtimeEncryptionQueue);
  CFStringRef v12 = [(NSMutableDictionary *)self->_groupIDToIsKeyMaterialRecoveryRunning objectForKeyedSubscript:v11];
  unsigned __int8 v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_groupIDToIsKeyMaterialRecoveryRunning setObject:&__kCFBooleanTrue forKeyedSubscript:v11];
    dispatch_time_t v14 = dispatch_walltime(0, 3000000000);
    realtimeEncryptionQueue = self->_realtimeEncryptionQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10019D7AC;
    v16[3] = &unk_1009848E0;
    v16[4] = self;
    BOOL v19 = a3;
    BOOL v20 = a4;
    id v17 = v10;
    id v18 = v11;
    dispatch_after(v14, realtimeEncryptionQueue, v16);
  }
}

- (id)createRealTimeEncryptionFullIdentityForDevice:(id)a3 completionBlock:(id)a4
{
  id v6 = (IDSRealTimeEncryptionIdentity *)a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "createRealTimeEncryptionFullIdentity for the token %@", buf, 0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    p_identityForDevice = &self->_identityForDevice;
    id v11 = self->_identityForDevice;
    if (v11)
    {
      CFStringRef v12 = v11;
      unsigned __int8 v13 = [(IDSRealTimeEncryptionIdentity *)v11 pushToken];
      unsigned int v14 = [v13 isEqual:v6];
      char v15 = v14;
      int v16 = v14 ^ 1;

      if (![(IDSRealTimeEncryptionIdentity *)v12 isExpired] && (v16 & 1) == 0)
      {
        id v17 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "createRealTimeEncryptionFullIdentity - found the existed one %@", buf, 0xCu);
        }

        os_unfair_lock_unlock(p_lock);
        if (v7)
        {
          id v18 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10019E068;
          block[3] = &unk_1009814F8;
          BOOL v65 = v12;
          id v66 = v7;
          dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
          dispatch_async(v18, v19);
        }
        BOOL v20 = v12;
        CFStringRef v12 = v20;
        goto LABEL_34;
      }
      if (([(IDSRealTimeEncryptionIdentity *)v12 isExpired] | v16))
      {
        id v23 = +[IDSFoundationLog RealTimeEncryptionController];
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v24)
          {
            *(_DWORD *)buf = 138412290;
            long long v68 = v12;
            CFStringRef v25 = "createRealTimeEncryptionFullIdentity - the previous one %@ is expired";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          }
        }
        else if (v24)
        {
          *(_DWORD *)buf = 138412290;
          long long v68 = v12;
          CFStringRef v25 = "createRealTimeEncryptionFullIdentity - push token doesn't match, generating a new identity {old: %@}";
          goto LABEL_25;
        }

        previousIdentityForDevice = self->_previousIdentityForDevice;
        self->_previousIdentityForDevice = v12;

        CFStringRef v12 = objc_alloc_init(IDSRealTimeEncryptionIdentity);
        [(IDSRealTimeEncryptionIdentity *)v12 setIsTestRunning:[(IDSGroupEncryptionController1 *)self isTestRunning]];
        objc_storeStrong((id *)&self->_identityForDevice, v12);
        dispatch_time_t v28 = dispatch_walltime(0, 1000000000 * self->_previousPrekeyExpireDuration);
        unsigned __int8 v29 = im_primary_queue();
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10019E128;
        v63[3] = &unk_10097E4D0;
        v63[4] = self;
        dispatch_after(v28, v29, v63);

        goto LABEL_27;
      }
    }
    else
    {
      CFStringRef v12 = objc_alloc_init(IDSRealTimeEncryptionIdentity);
      [(IDSRealTimeEncryptionIdentity *)v12 setIsTestRunning:[(IDSGroupEncryptionController1 *)self isTestRunning]];
      objc_storeStrong((id *)&self->_identityForDevice, v12);
    }
    char v26 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v68 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "createRealTimeEncryptionFullIdentity - we'll generate the new pre-key %@", buf, 0xCu);
    }

LABEL_27:
    ids_monotonic_time();
    double v31 = v30;
    [(IDSRealTimeEncryptionIdentity *)v12 setPushToken:v6];
    __int16 v32 = +[NSDate date];
    LODWORD(v33) = self->_prekeyExpireDuration;
    id v34 = [v32 dateByAddingTimeInterval:(double)v33];
    [(IDSRealTimeEncryptionIdentity *)v12 setExpirationDate:v34];

    [(IDSRealTimeEncryptionIdentity *)v12 setWrapMode:1];
    if ([(IDSGroupEncryptionController1 *)self isTestRunning])
    {
      id v35 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *p_identityForDevice;
        double v37 = [(IDSRealTimeEncryptionIdentity *)v12 expirationDate];
        *(_DWORD *)buf = 138478083;
        long long v68 = v36;
        __int16 v69 = 2112;
        double v70 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Created the full identity %{private}@ will be expired at %@", buf, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
      if (v7)
      {
        uint64_t v38 = im_primary_queue();
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10019E1A8;
        v61[3] = &unk_10097E7F0;
        id v62 = v7;
        dispatch_block_t v39 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v61);
        dispatch_async(v38, v39);
      }
      identityForDevice = *p_identityForDevice;
LABEL_33:
      BOOL v20 = identityForDevice;
LABEL_34:
      long long v22 = v20;
LABEL_60:

      goto LABEL_61;
    }
    CFTypeRef cf = 0;
    if (qword_100A4A910 != -1) {
      dispatch_once(&qword_100A4A910, &stru_100984900);
    }
    if (off_100A4A908 && (uint64_t v41 = off_100A4A908(0, &cf)) != 0 && !cf)
    {
      id v42 = (const void *)v41;
      if (qword_100A4A920 != -1) {
        dispatch_once(&qword_100A4A920, &stru_100984920);
      }
      if (off_100A4A918)
      {
        uint64_t v43 = off_100A4A918(v42);
        if (v43)
        {
          id v44 = (const void *)v43;
          [(IDSRealTimeEncryptionIdentity *)v12 setFullIdentity:v42];
          [(IDSRealTimeEncryptionIdentity *)v12 setPublicIdentity:v44];
          CFRelease(v42);
          CFRelease(v44);
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          ids_monotonic_time();
          double v46 = v45;
          id v47 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = *p_identityForDevice;
            id v49 = [(IDSRealTimeEncryptionIdentity *)v48 expirationDate];
            *(_DWORD *)buf = 138478339;
            long long v68 = v48;
            __int16 v69 = 2048;
            double v70 = v46 - v31;
            __int16 v71 = 2112;
            id v72 = v49;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Created the full identity %{private}@, duration %f seconds, will be expired at %@", buf, 0x20u);
          }
          os_unfair_lock_unlock(&self->_lock);
          if (v7)
          {
            uint32_t v50 = im_primary_queue();
            uint64_t v55 = _NSConcreteStackBlock;
            uint64_t v56 = 3221225472;
            id v57 = sub_10019E218;
            unsigned int v58 = &unk_10097E7F0;
            id v59 = v7;
            dispatch_block_t v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, &v55);
            dispatch_async(v50, v51);
          }
          [(IDSGroupEncryptionController1 *)self _dispatchRenewPrekeyTimer];
          identityForDevice = self->_identityForDevice;
          goto LABEL_33;
        }
      }
      char v53 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_100714FA8();
      }

      CFRelease(v42);
    }
    else
    {
      id v52 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
        sub_100714F2C((uint64_t *)&cf, v52);
      }
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    os_unfair_lock_unlock(p_lock);
    long long v22 = 0;
    goto LABEL_60;
  }
  id v21 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_100714EF8();
  }

  os_unfair_lock_unlock(&self->_lock);
  long long v22 = 0;
LABEL_61:

  return v22;
}

- (int64_t)realTimeEncryptionPublicKeyWrappingMode
{
  return (id)[(IDSRealTimeEncryptionIdentity *)self->_identityForDevice wrapMode] == (id)1;
}

- (id)realTimeEncryptionPublicKeyData
{
  id v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "realTimeEncryptionPublicKeyData - trying to get my device identity", (uint8_t *)&v22, 2u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v5 = self->_identityForDevice;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = +[NSDate date];
    id v7 = [(IDSRealTimeEncryptionIdentity *)v5 expirationDate];
    id v8 = [v6 compare:v7];

    if (v8 != (id)1) {
      goto LABEL_38;
    }
    unsigned int v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Identity is expired. Need to roll the fresh key.", (uint8_t *)&v22, 2u);
    }

    id v10 = [(IDSRealTimeEncryptionIdentity *)v5 pushToken];
    uint64_t v11 = [(IDSGroupEncryptionController1 *)self createRealTimeEncryptionFullIdentityForDevice:v10 completionBlock:0];

    dispatch_time_t v5 = (IDSRealTimeEncryptionIdentity *)v11;
    if (!v11)
    {
      dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
        sub_100715010();
      }
    }
    else
    {
LABEL_38:
      if ([(IDSGroupEncryptionController1 *)self isTestRunning])
      {
        CFStringRef v12 = [(IDSRealTimeEncryptionIdentity *)v5 publicKeyData];
        unsigned __int8 v13 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412290;
          id v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Returning public key data: %@", (uint8_t *)&v22, 0xCu);
        }

        unsigned int v14 = v12;
LABEL_21:
        id v18 = v14;

        dispatch_time_t v5 = v18;
        goto LABEL_33;
      }
      os_unfair_lock_lock(&self->_lock);
      if ([(IDSRealTimeEncryptionIdentity *)v5 publicIdentity])
      {
        char v15 = 0;
LABEL_16:
        int v16 = [(IDSRealTimeEncryptionIdentity *)v5 publicKeyData];
        os_unfair_lock_unlock(p_lock);
        if (v15) {
          CFRelease(v15);
        }
        id v17 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412290;
          id v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Returning public key data: %@", (uint8_t *)&v22, 0xCu);
        }

        unsigned int v14 = v16;
        goto LABEL_21;
      }
      if (qword_100A4A930 != -1) {
        dispatch_once(&qword_100A4A930, &stru_100984940);
      }
      if (off_100A4A928)
      {
        uint64_t v19 = ((uint64_t (*)(__SecKey *))off_100A4A928)([(IDSRealTimeEncryptionIdentity *)v5 fullIdentity]);
        if (v19)
        {
          char v15 = (const void *)v19;
          [(IDSRealTimeEncryptionIdentity *)v5 setPublicIdentity:v19];
          goto LABEL_16;
        }
      }
      BOOL v20 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100715044(v5, v20);
      }

      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEFAULT, "Need to create the full identity for this device first...", (uint8_t *)&v22, 2u);
    }
  }
  id v18 = 0;
LABEL_33:

  return v18;
}

- (void)processIncomingPrekeyAckForGroup:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 intValue] + 1);
  [(NSMutableDictionary *)self->_prekeyAckCountForGroup setObject:v6 forKeyedSubscript:v4];

  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current ACK'd number of prekey: %@ for group: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)reportPrekeyAckStatus:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v4];
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Report the prekey ACK'd (final count: %@) result for group: %@", (uint8_t *)&v7, 0x16u);
  }
  [(NSMutableDictionary *)self->_prekeyAckCountForGroup removeObjectForKey:v4];
}

- (void)_resetKeyCacheForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache setObject:0 forKeyedSubscript:v4];
    encryptionSequenceNumbers = self->_encryptionSequenceNumbers;
    if (encryptionSequenceNumbers) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)encryptionSequenceNumbers, v4);
    }
    os_unfair_lock_unlock(&self->_lock);
    groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
    if (groupIDToResetKeyMaterialCacheTimer) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)groupIDToResetKeyMaterialCacheTimer, v4);
    }
  }
  else
  {
    int v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[IDSGroupEncryptionController1 _resetKeyCacheForGroup:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s invalid groupID, return", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)resetMKMCacheAfterTimeoutForGroup:(id)a3 interval:(unint64_t)a4
{
  id v6 = (NSMutableDictionary *)a3;
  if (v6)
  {
    [(IDSGroupEncryptionController1 *)self resetKeyMaterialCacheTimerIfNeeded:v6];
    if (a4)
    {
      id v7 = objc_alloc((Class)IMDispatchTimer);
      int v8 = im_primary_queue();
      int v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      id v18 = sub_10019EC70;
      uint64_t v19 = &unk_100984968;
      __int16 v9 = v6;
      BOOL v20 = v9;
      id v21 = self;
      id v10 = [v7 initWithQueue:v8 interval:a4 repeats:0 handlerBlock:&v16];

      if (v10) {
        CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToResetKeyMaterialCacheTimer, v9, v10);
      }
      __int16 v11 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v24 = 2112;
        CFStringRef v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s dispatched keyMaterial reset timer for group: %@", buf, 0x16u);
      }

      id v12 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
        *(_DWORD *)buf = 136315394;
        id v23 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v24 = 2112;
        CFStringRef v25 = groupIDToResetKeyMaterialCacheTimer;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s _groupIDToResetKeyMaterialCacheTimer: %@", buf, 0x16u);
      }
    }
    else
    {
      char v15 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v23 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
        __int16 v24 = 2112;
        CFStringRef v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s interval is 0, directly reset key cache for group: %@", buf, 0x16u);
      }

      [(IDSGroupEncryptionController1 *)self _resetKeyCacheForGroup:v6];
    }
  }
  else
  {
    unsigned int v14 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[IDSGroupEncryptionController1 resetMKMCacheAfterTimeoutForGroup:interval:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s invalid groupID, return", buf, 0xCu);
    }
  }
}

- (void)resetKeyMaterialCacheTimerIfNeeded:(id)a3
{
  id v4 = (NSMutableDictionary *)a3;
  if (v4)
  {
    groupIDToResetKeyMaterialCacheTimer = self->_groupIDToResetKeyMaterialCacheTimer;
    if (groupIDToResetKeyMaterialCacheTimer
      && (id v6 = (id)CFDictionaryGetValue((CFDictionaryRef)groupIDToResetKeyMaterialCacheTimer, v4)) != 0)
    {
      id v7 = v6;
      int v8 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s keyMaterial reset timer invalidated for group: %@", (uint8_t *)&v15, 0x16u);
      }

      [v7 invalidate];
    }
    else
    {
      id v7 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s keyMaterial reset timer not found for group: %@", (uint8_t *)&v15, 0x16u);
      }
    }

    __int16 v9 = self->_groupIDToResetKeyMaterialCacheTimer;
    if (v9) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)v9, v4);
    }
    id v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = self->_groupIDToResetKeyMaterialCacheTimer;
      int v15 = 136315394;
      int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
      __int16 v17 = 2112;
      id v18 = v11;
      id v12 = "%s _groupIDToResetKeyMaterialCacheTimer: %@";
      unsigned __int8 v13 = v10;
      uint32_t v14 = 22;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
    }
  }
  else
  {
    id v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      int v16 = "-[IDSGroupEncryptionController1 resetKeyMaterialCacheTimerIfNeeded:]";
      id v12 = "%s invalid groupID!";
      unsigned __int8 v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_15;
    }
  }
}

- (void)storeEncryptionSequenceNumber:(unint64_t)a3 groupID:(id)a4
{
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_encryptionSequenceNumbers objectForKeyedSubscript:v6];
  id v8 = [v7 unsignedLongLongValue];

  __int16 v9 = +[IDSFoundationLog RealTimeEncryptionController];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v8 >= a3)
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ignoring encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 134218498;
      unint64_t v12 = a3;
      __int16 v13 = 2048;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "storing encryption sequence number %llu (old: %llu) for groupID %@ (Client -> *IDSD)", (uint8_t *)&v11, 0x20u);
    }

    __int16 v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    if (v9)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_encryptionSequenceNumbers, v6, v9);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1007150CC();
    }
  }
}

- (unint64_t)encryptionSequenceNumberForGroupID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [(NSMutableDictionary *)self->_encryptionSequenceNumbers objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedLongLongValue];

  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "returning stored encryption sequence number %llu for groupID %@ (Client <- *IDSD)", (uint8_t *)&v9, 0x16u);
  }

  return (unint64_t)v6;
}

- (BOOL)setRealTimeEncryptionPublicKey:(id)a3 forDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 wrapMode:(int64_t)a9
{
  __int16 v15 = (IDSGroupEncryptionController1 *)a3;
  id v16 = a4;
  __int16 v17 = (IDSGroupEncryptionController1 *)a5;
  id v18 = (IDSGroupEncryptionController1 *)a6;
  id v19 = a7;
  BOOL v20 = (IDSGroupEncryptionController1 *)a8;
  id v21 = [(IDSGroupEncryptionController1 *)self sessionController];
  __int16 v75 = v19;
  int v22 = [v21 sessionWithUniqueID:v19];

  CFStringRef v76 = v20;
  if (v22)
  {
    id v23 = [(IDSGroupEncryptionController1 *)v17 URIByAddingOptionalPushToken:v16];
    unsigned __int8 v24 = [v22 destinationsContainFromURI:v23];

    if ((v24 & 1) == 0)
    {
      dispatch_time_t v28 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v89 = v18;
        __int16 v90 = 2112;
        __int16 v91 = v17;
        _os_log_impl((void *)&_mh_execute_header, &v28->super, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: We'll drop this pre-key message for group %@ since %@ is not in this group!", buf, 0x16u);
      }
      BOOL v32 = 0;
      goto LABEL_46;
    }
  }
  __int16 v73 = v18;
  CFStringRef v25 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478595;
    __int16 v89 = v15;
    __int16 v90 = 2112;
    __int16 v91 = v20;
    __int16 v92 = 2112;
    CFTypeRef v93 = v16;
    __int16 v94 = 2048;
    int64_t v95 = a9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: public key: %{private}@ serverDate: %@ pushToken: %@ wrapMode: %llu", buf, 0x2Au);
  }

  [(IDSGroupEncryptionController1 *)self removeExpiredPrekeys];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v26 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v16];
  CFStringRef v74 = v15;
  if (v26)
  {
    dispatch_time_t v28 = (IDSRealTimeEncryptionIdentity *)v26;
    LODWORD(v27) = self->_prekeyExpireDuration;
    unsigned __int8 v29 = [(IDSGroupEncryptionController1 *)v20 dateByAddingTimeInterval:(double)v27];
    double v30 = [(IDSRealTimeEncryptionIdentity *)v28 expirationDate];
    id v31 = [v29 compare:v30];

    if (v31 == (id)-1)
    {
      uint64_t v41 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = [(IDSRealTimeEncryptionIdentity *)v28 publicIdentityData];
        *(_DWORD *)buf = 138478595;
        __int16 v89 = v74;
        __int16 v90 = 2113;
        __int16 v91 = v42;
        __int16 v92 = 2112;
        CFTypeRef v93 = v17;
        __int16 v94 = 2112;
        int64_t v95 = (int64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: dropping the stale public key: %{private}@ already have new public key: %{private}@ fromURI: %@ pushToken: %@", buf, 0x2Au);
      }
      os_unfair_lock_unlock(&self->_lock);
      BOOL v32 = 0;
      __int16 v15 = v74;
      goto LABEL_46;
    }
    __int16 v15 = v74;
    BOOL v20 = v76;
  }
  else
  {
    dispatch_time_t v28 = objc_alloc_init(IDSRealTimeEncryptionIdentity);
    [(IDSRealTimeEncryptionIdentity *)v28 setIsTestRunning:[(IDSGroupEncryptionController1 *)self isTestRunning]];
    [(NSMutableDictionary *)self->_publicKeyForDevice setObject:v28 forKeyedSubscript:v16];
  }
  [(IDSRealTimeEncryptionIdentity *)v28 setPushToken:v16];
  unint64_t v33 = [(IDSGroupEncryptionController1 *)v17 unprefixedURI];
  [(IDSRealTimeEncryptionIdentity *)v28 setFromID:v33];

  [(IDSRealTimeEncryptionIdentity *)v28 setWrapMode:a9 == 1];
  if (![(IDSGroupEncryptionController1 *)self isTestRunning])
  {
    CFTypeRef cf = 0;
    keys[0] = (void *)kSecAttrKeyType;
    keys[1] = (void *)kSecAttrKeyClass;
    values[0] = (void *)kSecAttrKeyTypeECSECPrimeRandom;
    values[1] = (void *)kSecAttrKeyClassPublic;
    CFDictionaryRef v39 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (qword_100A4A940 != -1) {
      dispatch_once(&qword_100A4A940, &stru_100984988);
    }
    if (off_100A4A938) {
      int v40 = (const void *)off_100A4A938(v74, v39, &cf);
    }
    else {
      int v40 = 0;
    }
    CFRelease(v39);
    if (v40) {
      BOOL v43 = cf == 0;
    }
    else {
      BOOL v43 = 0;
    }
    BOOL v32 = v43;
    if (v43)
    {
      __int16 v69 = v17;
      id v44 = [(IDSRealTimeEncryptionIdentity *)v28 publicIdentityData];
      unsigned __int8 v45 = [v44 isEqualToData:v74];

      if (v45)
      {
        double v46 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v71 = [(IDSRealTimeEncryptionIdentity *)v28 publicIdentityData];
          long long v67 = [(IDSRealTimeEncryptionIdentity *)v28 fromID];
          IDSLoggableDescriptionForHandleOnService();
          id v66 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue();
          id v47 = [(IDSRealTimeEncryptionIdentity *)v28 pushToken];
          uint64_t v48 = [(IDSRealTimeEncryptionIdentity *)v28 expirationDate];
          *(_DWORD *)buf = 138478595;
          __int16 v89 = v71;
          __int16 v90 = 2112;
          __int16 v91 = v66;
          __int16 v92 = 2112;
          CFTypeRef v93 = v47;
          __int16 v94 = 2112;
          int64_t v95 = v48;
          id v49 = (void *)v48;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: received the same key %{private}@ fromID %@ pushToken %@ expiration %@", buf, 0x2Au);
        }
        id v72 = 0;
      }
      else
      {
        id v72 = [(IDSRealTimeEncryptionIdentity *)v28 publicIdentityData];
        [(IDSRealTimeEncryptionIdentity *)v28 setPublicIdentityData:v74];
        [(IDSRealTimeEncryptionIdentity *)v28 setPublicIdentity:v40];
        LODWORD(v52) = self->_prekeyExpireDuration;
        double v46 = [(IDSGroupEncryptionController1 *)v76 dateByAddingTimeInterval:(double)v52];
        [(IDSRealTimeEncryptionIdentity *)v28 setExpirationDate:v46];
      }
      __int16 v17 = v69;
      char v53 = v73;

      CFRelease(v40);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      [(IDSGroupEncryptionController1 *)self _locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:v73 remoteToken:v16 previousRemotePublicKey:v72 newRemotePublicKey:v74];
      os_unfair_lock_unlock(&self->_lock);
      BOOL v54 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [(IDSRealTimeEncryptionIdentity *)v28 publicIdentityData];
        double v70 = [(IDSRealTimeEncryptionIdentity *)v28 fromID];
        IDSLoggableDescriptionForHandleOnService();
        long long v68 = (IDSGroupEncryptionController1 *)objc_claimAutoreleasedReturnValue();
        uint64_t v56 = [(IDSRealTimeEncryptionIdentity *)v28 pushToken];
        *(_DWORD *)buf = 138478339;
        __int16 v89 = v55;
        __int16 v90 = 2112;
        __int16 v91 = v68;
        __int16 v92 = 2112;
        CFTypeRef v93 = v56;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: done: %{private}@ fromID %@ pushToken %@", buf, 0x20u);

        char v53 = v73;
      }

      id v57 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10019FC80;
      block[3] = &unk_1009812A0;
      void block[4] = self;
      unsigned int v58 = v53;
      __int16 v81 = v58;
      id v59 = v75;
      id v82 = v59;
      id v83 = v16;
      unsigned int v84 = v17;
      dispatch_block_t v60 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
      dispatch_async(v57, v60);

      id v61 = im_primary_queue();
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10019FC94;
      v77[3] = &unk_10097E418;
      v77[4] = self;
      id v62 = v58;
      id v78 = v62;
      id v63 = v59;
      id v79 = v63;
      dispatch_block_t v64 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v77);
      dispatch_async(v61, v64);

      id v18 = v73;
      [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v62 sessionID:v63];
      [(IDSGroupEncryptionController1 *)self notifyPreKeyChange];

      __int16 v15 = v74;
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      uint32_t v50 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218499;
        __int16 v89 = self;
        __int16 v90 = 2113;
        __int16 v91 = v18;
        __int16 v92 = 2112;
        CFTypeRef v93 = cf;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%p: Couldn't create the public identity for the group %{private}@ (error: %@)", buf, 0x20u);
      }

      __int16 v15 = v74;
      if (cf) {
        CFRelease(cf);
      }
    }
LABEL_46:
    uint64_t v38 = v75;
    goto LABEL_47;
  }
  LODWORD(v34) = self->_prekeyExpireDuration;
  id v35 = [(IDSGroupEncryptionController1 *)v20 dateByAddingTimeInterval:(double)v34];
  [(IDSRealTimeEncryptionIdentity *)v28 setExpirationDate:v35];

  [(IDSRealTimeEncryptionIdentity *)v28 setPublicIdentityData:v15];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v36 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    publicKeyForDevice = self->_publicKeyForDevice;
    *(_DWORD *)buf = 138477827;
    __int16 v89 = (IDSGroupEncryptionController1 *)publicKeyForDevice;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: (TEST) done: %{private}@", buf, 0xCu);
  }

  uint64_t v38 = v75;
  [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v18 sessionID:v75];
  [(IDSGroupEncryptionController1 *)self notifyPreKeyChange];
  BOOL v32 = 1;
LABEL_47:

  return v32;
}

- (void)_locked_updateParticipantsWaitingForKeyMaterialsIfNeededForGroupID:(id)a3 remoteToken:(id)a4 previousRemotePublicKey:(id)a5 newRemotePublicKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  if (v14)
  {
    __int16 v15 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v10];
    unsigned int v16 = [v15 containsObject:v14];

    int v17 = v16 ^ 1;
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    int v20 = 1;
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  int v17 = 1;
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  id v18 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v10];
  unsigned int v19 = [v18 containsObject:v11];

  int v20 = v19 ^ 1;
  if (!v12) {
    goto LABEL_17;
  }
LABEL_7:
  if (v13)
  {
    unsigned __int8 v21 = [v12 isEqualToData:v13];
    if (((v17 | v20) & 1) == 0 && (v21 & 1) == 0)
    {
      int v22 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "setRealTimeEncryptionPublicKey: will re-send key materials due to detected rolled identity for push token %@", (uint8_t *)&v25, 0xCu);
      }

      id v23 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v10];
      id v24 = [v23 mutableCopy];

      if (([v24 containsObject:v11] & 1) == 0)
      {
        if (!v24) {
          id v24 = objc_alloc_init((Class)NSMutableArray);
        }
        [v24 addObject:v11];
        [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials setObject:v24 forKeyedSubscript:v10];
      }
    }
  }
LABEL_17:
}

- (id)realTimeEncryptionPublicKeyForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "realTimeEncryptionPublicKeyForDevice: %@", (uint8_t *)&v11, 0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v4];
  if (v7)
  {
    os_unfair_lock_unlock(p_lock);
    id v8 = v7;
  }
  else
  {
    int v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10071515C();
    }

    os_unfair_lock_unlock(p_lock);
  }

  return v7;
}

- (id)realTimeEncryptionPublicKeyDataForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "realTimeEncryptionPublicKeyDataForDevice: %@", (uint8_t *)&v12, 0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v4];
  id v8 = v7;
  if (v7)
  {
    int v9 = [v7 publicKeyData];
  }
  else
  {
    id v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007151C4();
    }

    int v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (int64_t)realTimeEncryptionPublicWrapModeForDevice:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "realTimeEncryptionPublicWrapModeForDevice: %@", (uint8_t *)&v11, 0xCu);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v4];
  if (v7)
  {
    os_unfair_lock_unlock(p_lock);
    int64_t v8 = (int64_t)[v7 wrapMode];
  }
  else
  {
    int v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10071522C();
    }

    os_unfair_lock_unlock(p_lock);
    int64_t v8 = -1;
  }

  return v8;
}

- (id)publicKeys
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  [(IDSGroupEncryptionController1 *)self removeExpiredPrekeys];
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_publicKeyForDevice allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v9];
        int v11 = [v10 publicKeyData];
        [(__CFDictionary *)Mutable setObject:v11 forKeyedSubscript:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v12 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFMutableDictionaryRef v19 = Mutable;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "publicKeys: %@", buf, 0xCu);
  }

  return Mutable;
}

- (void)sendPrekeyRequestToGroup:(id)a3 sessionID:(id)a4
{
  membersForGroup = self->_membersForGroup;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(NSMutableDictionary *)membersForGroup objectForKeyedSubscript:v8];
  id v11 = +[NSSet setWithArray:v9];

  id v10 = +[IDSDestination destinationWithDestinations:v11];
  [(IDSGroupEncryptionController1 *)self sendPrekeyRequestToDestination:v10 group:v8 sessionID:v7];
}

- (void)sendPrekeyRequestToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = IDSFanoutMessageGroupIDKey;
  v32[1] = IDSDSessionMessageSessionID;
  v33[0] = v9;
  v33[1] = v10;
  v32[2] = IDSDSessionMessageRealTimeEncryptionPreKeyRecoveryRequestKey;
  v33[2] = &__kCFBooleanTrue;
  id v11 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  id v12 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A07BC;
  block[3] = &unk_1009812A0;
  void block[4] = self;
  id v13 = v11;
  id v24 = v13;
  id v14 = v8;
  id v25 = v14;
  id v15 = v9;
  id v26 = v15;
  id v16 = v10;
  id v27 = v16;
  dispatch_async(v12, block);

  long long v17 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sendPrekeyRequestToGroup: %@, (destination: %@)", buf, 0x16u);
  }

  id v18 = [(IDSGroupEncryptionController1 *)self sessionController];
  CFMutableDictionaryRef v19 = [v18 sessionWithUniqueID:v16];

  if (v19)
  {
    int v20 = [v14 destinationURIs];
    unsigned __int8 v21 = [(IDSGroupEncryptionController1 *)self participantIDsForURIs:v20 group:v15];
    int v22 = [v21 allObjects];
    [v19 requestMaterialsForParticipantIDs:v22 materialType:11];
  }
}

- (id)participantInfoByURIForGroup:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v4];
  id v8 = [v7 copy];

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    id v22 = v4;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v14 isKnown])
          {
            id v15 = [v14 participantURI];
            id v16 = [v5 objectForKeyedSubscript:v15];

            if (!v16)
            {
              id v17 = objc_alloc_init((Class)NSMutableArray);
              id v18 = [v14 participantURI];
              [v5 setObject:v17 forKeyedSubscript:v18];
            }
            CFMutableDictionaryRef v19 = [v14 participantURI];
            int v20 = [v5 objectForKeyedSubscript:v19];
            [v20 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    id v4 = v22;
  }

  return v5;
}

- (id)participantIDsForURIs:(id)a3 group:(id)a4
{
  id v6 = a3;
  long long v25 = [(IDSGroupEncryptionController1 *)self participantInfoByURIForGroup:a4];
  id v7 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v24 = *(void *)v31;
    *(void *)&long long v9 = 138412290;
    long long v22 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "_stripPotentialTokenURIWithToken:", 0, v22);
        id v13 = [v25 objectForKeyedSubscript:v12];
        id v14 = v13;
        if (v13)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v27;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v27 != v17) {
                  objc_enumerationMutation(v14);
                }
                CFMutableDictionaryRef v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) participantIdentifier]);
                [v7 addObject:v19];
              }
              id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v16);
          }
        }
        else
        {
          int v20 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            uint64_t v36 = v12;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "participantIDsForURIs: did not find participant for uri %@", buf, 0xCu);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)cleanUpExpiredMasterKeyMaterial
{
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint32_t v50 = sub_1001A12E0;
  dispatch_block_t v51 = sub_1001A12F0;
  id v52 = (id)0xAAAAAAAAAAAAAAAALL;
  id v52 = +[NSMutableDictionary dictionary];
  os_unfair_lock_lock(&self->_lock);
  long long v46 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  id v3 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache allValues];
  id v4 = [v3 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v4)
  {
    uint64_t v40 = *(void *)v44;
    id obj = v3;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1001A12F8;
        v42[3] = &unk_1009849B0;
        v42[4] = self;
        v42[5] = &v47;
        id v7 = +[NSPredicate predicateWithBlock:v42];
        [v6 cleanUpMasterKeyMaterialUsingPredicate:v7];

        id v8 = [v6 currentLocalMasterKeyMaterial];
        long long v9 = [v8 createdAt];
        LODWORD(v10) = self->_mkmExpireDuration;
        id v11 = [v9 dateByAddingTimeInterval:(double)v10];

        uint64_t v12 = +[NSDate date];
        BOOL v13 = [v12 compare:v11] == (id)1;

        if (v13)
        {
          id v14 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v54 = v11;
            __int16 v55 = 2112;
            uint64_t v56 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "cleanUpExpiredMasterKeyMaterial: Found expired current local MkM { expirationDate: %@, MkM: %@ }", buf, 0x16u);
          }

          [v6 setCurrentLocalMasterKeyMaterial:0];
          id v15 = (void *)v48[5];
          id v16 = [v8 groupID];
          id v17 = v15;
          id v18 = v16;
          CFMutableDictionaryRef v19 = [v17 objectForKeyedSubscript:v18];
          if (!v19)
          {
            CFMutableDictionaryRef v19 = +[NSMutableArray array];
            [v17 setObject:v19 forKeyedSubscript:v18];
          }

          int v20 = [v8 keyIndex];
          id v21 = [v20 copy];
          [v19 addObject:v21];
        }
        long long v22 = [v6 nextLocalMasterKeyMaterial];
        long long v23 = [v22 createdAt];
        LODWORD(v24) = self->_mkmExpireDuration;
        long long v25 = [v23 dateByAddingTimeInterval:(double)v24];

        long long v26 = +[NSDate date];
        LODWORD(v23) = [v26 compare:v25] == (id)1;

        if (v23)
        {
          long long v27 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v54 = v25;
            __int16 v55 = 2112;
            uint64_t v56 = v22;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "cleanUpExpiredMasterKeyMaterial: Found expired next MkM { expirationDate: %@, MkM: %@ }", buf, 0x16u);
          }

          [v6 setNextLocalMasterKeyMaterial:0];
          long long v28 = (void *)v48[5];
          long long v29 = [v22 groupID];
          id v30 = v28;
          id v31 = v29;
          long long v32 = [v30 objectForKeyedSubscript:v31];
          if (!v32)
          {
            long long v32 = +[NSMutableArray array];
            [v30 setObject:v32 forKeyedSubscript:v31];
          }

          long long v33 = [v22 keyIndex];
          id v34 = [v33 copy];
          [v32 addObject:v34];
        }
        else
        {
          id v35 = [v6 currentLocalMasterKeyMaterial];
          BOOL v36 = v35 == 0;

          if (v36)
          {
            double v37 = [v6 nextLocalMasterKeyMaterial];
            [v6 setCurrentLocalMasterKeyMaterial:v37];

            [v6 setNextLocalMasterKeyMaterial:0];
          }
        }
      }
      id v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v4);
  }

  uint64_t v38 = (void *)v48[5];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001A14CC;
  v41[3] = &unk_1009849D8;
  v41[4] = self;
  [v38 enumerateKeysAndObjectsUsingBlock:v41];
  os_unfair_lock_unlock(&self->_lock);
  _Block_object_dispose(&v47, 8);
}

- (void)_handleMkmRollTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimer objectForKeyedSubscript:v4];
  id v6 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimerBlock objectForKeyedSubscript:v4];
  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    int v9 = 134218240;
    unint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MKMRoll timer %p fired, block %p.", (uint8_t *)&v9, 0x16u);
  }
  [(IDSGroupEncryptionController1 *)self _stopMkmRollTimerForGroup:v4];
  if (v6) {
    v6[2](v6);
  }
}

- (void)_startMkmRollTimer:(int)a3 forGroupID:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimer objectForKeyedSubscript:v8];
  uint64_t v11 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimerBlock objectForKeyedSubscript:v8];
  if (v10 | v11)
  {
    uint64_t v12 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_retainBlock((id)v11);
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v10;
      __int16 v28 = 2048;
      v29[0] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MKMRoll timer %p and block %p are already scheduled.", buf, 0x16u);
    }
  }
  else
  {
    id v14 = im_primary_queue();
    uint64_t v10 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);

    dispatch_time_t v15 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer((dispatch_source_t)v10, v15, 1000000000 * a3, 0x5F5E100uLL);
    int v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    long long v22 = sub_1001A1A34;
    long long v23 = &unk_10097E440;
    unint64_t v24 = self;
    id v16 = v8;
    id v25 = v16;
    dispatch_source_set_event_handler((dispatch_source_t)v10, &v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIDToMKMRollTimer, "setObject:forKeyedSubscript:", v10, v16, v20, v21, v22, v23, v24);
    id v17 = objc_retainBlock(v9);
    [(NSMutableDictionary *)self->_groupIDToMKMRollTimerBlock setObject:v17 forKeyedSubscript:v16];

    dispatch_resume((dispatch_object_t)v10);
    id v18 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_retainBlock(v9);
      *(_DWORD *)buf = 134218496;
      uint64_t v27 = v10;
      __int16 v28 = 1024;
      LODWORD(v29[0]) = a3;
      WORD2(v29[0]) = 2048;
      *(void *)((char *)v29 + 6) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "start mkmRoll timer %p, timeout %d sec, block %p ", buf, 0x1Cu);
    }
  }
}

- (void)_stopMkmRollTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimer objectForKeyedSubscript:v4];
  id v6 = [(NSMutableDictionary *)self->_groupIDToMKMRollTimerBlock objectForKeyedSubscript:v4];
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_retainBlock(v6);
      int v9 = 134218240;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stop mkmRollTimer timer %p, block %p.", (uint8_t *)&v9, 0x16u);
    }
    [(NSMutableDictionary *)self->_groupIDToMKMRollTimer setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_groupIDToMKMRollTimerBlock setObject:0 forKeyedSubscript:v4];
  }
}

- (void)_handleMkmExpirationTimerForGroup:(id)a3
{
  groupIDToMKMExpirationTimer = self->_groupIDToMKMExpirationTimer;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)groupIDToMKMExpirationTimer objectForKeyedSubscript:v5];
  id v7 = [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimerBlock objectForKeyedSubscript:v5];

  id v8 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_retainBlock(v7);
    int v10 = 134218240;
    __int16 v11 = v6;
    __int16 v12 = 2048;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "mkmExpiration timer %p fired, block %p.", (uint8_t *)&v10, 0x16u);
  }
  if (v7) {
    v7[2](v7);
  }
}

- (void)_startMkmExpirationTimer:(int)a3 forGroupID:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimer objectForKeyedSubscript:v8];
  uint64_t v11 = [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimerBlock objectForKeyedSubscript:v8];
  if (v10 | v11)
  {
    __int16 v12 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_retainBlock((id)v11);
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v10;
      __int16 v28 = 2048;
      id v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "mkmExpiration timer %p and block %p are already scheduled.", buf, 0x16u);
    }
  }
  else
  {
    id v14 = im_primary_queue();
    uint64_t v10 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);

    dispatch_time_t v15 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer((dispatch_source_t)v10, v15, 1000000000 * a3, 0x5F5E100uLL);
    int v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    long long v22 = sub_1001A1F68;
    long long v23 = &unk_10097E440;
    unint64_t v24 = self;
    id v16 = v8;
    id v25 = v16;
    dispatch_source_set_event_handler((dispatch_source_t)v10, &v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIDToMKMExpirationTimer, "setObject:forKeyedSubscript:", v10, v16, v20, v21, v22, v23, v24);
    id v17 = objc_retainBlock(v9);
    [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimerBlock setObject:v17 forKeyedSubscript:v16];

    dispatch_resume((dispatch_object_t)v10);
    id v18 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_retainBlock(v9);
      *(_DWORD *)buf = 134218754;
      uint64_t v27 = v10;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 1024;
      int v31 = a3;
      __int16 v32 = 2048;
      id v33 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "start mkmExpiration timer %p, groupID: %@, timeout %d sec, block %p ", buf, 0x26u);
    }
  }
}

- (void)_stopMkmExpirationTimerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimer objectForKeyedSubscript:v4];
  id v6 = [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimerBlock objectForKeyedSubscript:v4];
  if (v5)
  {
    dispatch_source_cancel(v5);
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_retainBlock(v6);
      int v9 = 134218498;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      __int16 v13 = 2048;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stop mkmExpiration timer %p, groupID: %@, block %p.", (uint8_t *)&v9, 0x20u);
    }
    [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimer setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_groupIDToMKMExpirationTimerBlock setObject:0 forKeyedSubscript:v4];
  }
}

- (void)_mkmRollTimerFiredForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_mkmRollTimerFiredForGroup: %@ sessionID:%@", (uint8_t *)&v26, 0x16u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
  __int16 v11 = [v10 nextLocalMasterKeyMaterial];

  if (v11)
  {
    id v12 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
    [v12 setCurrentLocalMasterKeyMaterial:v11];

    __int16 v13 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
    id v14 = [v13 currentLocalMasterKeyMaterial];
    dispatch_time_t v15 = +[NSDate date];
    [v14 changeCreatedAt:v15];

    id v16 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
    [v16 setNextLocalMasterKeyMaterial:0];

    id v17 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
      id v19 = [v18 currentLocalMasterKeyMaterial];
      int v20 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
      uint64_t v21 = [v20 nextLocalMasterKeyMaterial];
      int v26 = 138412546;
      id v27 = v19;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MKMRoll timer fired: current MKM: %@, next MKM: %@", (uint8_t *)&v26, 0x16u);
    }
    long long v22 = [(IDSGroupEncryptionController1 *)self sessionController];
    long long v23 = [v22 sessionWithUniqueID:v7];

    if (v23)
    {
      if (([v11 isSentToClient] & 1) == 0)
      {
        [v23 recvKeyMaterial:v11];
        [v11 setIsSentToClient:1];
      }
    }
    else
    {
      id v25 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100715294();
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    unint64_t v24 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_mkmRollTimerFiredForGroup: no new current local material. Requesting...", (uint8_t *)&v26, 2u);
    }

    os_unfair_lock_unlock(&self->_lock);
    [(IDSGroupEncryptionController1 *)self requestKeyMaterialForGroup:v6 sessionID:v7 shouldGenerateMKM:1];
  }
}

- (int64_t)setLocalParticipantID:(unint64_t)a3 forGroupID:(id)a4 sessionID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    if (!self->_groupIDToLocalParticipantID)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      groupIDToLocalParticipantID = self->_groupIDToLocalParticipantID;
      self->_groupIDToLocalParticipantID = Mutable;
    }
    id v12 = +[NSNumber numberWithUnsignedLongLong:a3];
    if (v12) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToLocalParticipantID, v8, v12);
    }

    __int16 v13 = [(IDSGroupEncryptionController1 *)self stableKeyMaterialForGroup:v8 sessionID:v9];
    id v14 = [(IDSGroupEncryptionController1 *)self masterKeyMaterialForGroup:v8];
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(p_lock);
    id v16 = [v13 participantID];
    uint64_t v17 = (uint64_t)v16;
    if (v16)
    {
      if (v16 == (id)a3)
      {
        int64_t v18 = 0;
        uint64_t v19 = 1;
        goto LABEL_17;
      }
      [v13 setParticipantID:a3];
      int v20 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1007152FC(v17);
      }
      uint64_t v19 = 2;
    }
    else
    {
      [v13 setParticipantID:a3];
      int v20 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218242;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "set localParticipantID: %llu for SKM: %@", (uint8_t *)&v24, 0x16u);
      }
      uint64_t v19 = 1;
    }

    int64_t v18 = v19;
LABEL_17:
    id v21 = [v14 participantID];
    if (v21)
    {
      if (v21 == (id)a3)
      {
LABEL_25:
        os_unfair_lock_unlock(p_lock);

        goto LABEL_26;
      }
      [v14 setParticipantID:a3];
      long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1007152FC(v17);
      }
      uint64_t v19 = 2;
    }
    else
    {
      [v14 setParticipantID:a3];
      long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218242;
        unint64_t v25 = a3;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "set localParticipantID: %llu for MKM: %@", (uint8_t *)&v24, 0x16u);
      }
    }

    int64_t v18 = v19;
    goto LABEL_25;
  }
  int64_t v18 = 0;
LABEL_26:

  return v18;
}

- (unint64_t)localParticipantIDForGroupID:(id)a3
{
  Value = 0;
  if (a3)
  {
    groupIDToLocalParticipantID = self->_groupIDToLocalParticipantID;
    if (groupIDToLocalParticipantID) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)groupIDToLocalParticipantID, a3);
    }
    uint64_t v3 = vars8;
  }
  return (unint64_t)[Value unsignedLongLongValue];
}

- (void)createKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IDSGroupEncryptionController1 *)self cleanUpExpiredMasterKeyMaterial];
  [(IDSGroupEncryptionController1 *)self _stopMkmRollTimerForGroup:v6];
  [(IDSGroupEncryptionController1 *)self _stopMkmExpirationTimerForGroup:v6];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(IDSGroupEncryptionController1 *)self _locked_ensureGroupMasterKeyMaterialCacheForGroup:v6];
  Value = 0;
  if (v6 && self->_groupIDToLocalParticipantID) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_groupIDToLocalParticipantID, v6);
  }
  id v11 = [Value unsignedLongLongValue];
  if ([(IDSGroupEncryptionController1 *)self isTestRunning])
  {
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__buf[16] = v12;
    *(_OWORD *)__buf = v12;
    arc4random_buf(__buf, 0x20uLL);
    __int16 v13 = +[NSData dataWithBytes:__buf length:32];
    p_os_unfair_lock_t lock = &self->_lock;
    id v14 = +[NSData dataWithBytes:__buf length:16];
    id v15 = objc_alloc((Class)IDSGroupEncryptionKeyMaterial);
    id v16 = +[NSUUID UUID];
    id v17 = [v15 initWithKeyMaterial:v13 keySalt:v14 keyIndex:v16 groupID:v6 participantID:v11];

    if (v17)
    {
LABEL_6:
      if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform])
      {
        int64_t v18 = [v9 firstLocalMasterKeyMaterial];

        if (!v18) {
          [v9 setFirstLocalMasterKeyMaterial:v17];
        }
      }
      uint64_t v19 = [v9 currentLocalMasterKeyMaterial];
      if (v19)
      {
      }
      else
      {
        long long v23 = [v9 nextLocalMasterKeyMaterial];

        if (!v23)
        {
          [v9 setCurrentLocalMasterKeyMaterial:v17];
          int v47 = 1;
          goto LABEL_17;
        }
      }
      [v9 setNextLocalMasterKeyMaterial:v17];
      int v47 = 0;
LABEL_17:
      long long v46 = v9;
      int v24 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        [v17 keyMaterial];
        v26 = id v25 = v7;
        [v17 keySalt];
        id v27 = v45 = v25;
        [v17 keyIndex];
        __int16 v28 = v43 = v17;
        id v29 = [v46 currentLocalMasterKeyMaterial];
        [v46 nextLocalMasterKeyMaterial];
        __int16 v30 = v44 = p_lock;
        if (v47) {
          CFStringRef v31 = @"YES";
        }
        else {
          CFStringRef v31 = @"NO";
        }
        __int16 v32 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
        *(_DWORD *)__buf = 138479619;
        *(void *)&__uint8_t buf[4] = v26;
        *(_WORD *)&__unsigned char buf[12] = 2112;
        *(void *)&__buf[14] = v27;
        *(_WORD *)&__buf[22] = 2112;
        *(void *)&__buf[24] = v28;
        __int16 v56 = 2112;
        id v57 = v6;
        __int16 v58 = 2112;
        id v59 = v29;
        __int16 v60 = 2112;
        id v61 = v30;
        __int16 v62 = 2112;
        CFStringRef v63 = v31;
        __int16 v64 = 2112;
        BOOL v65 = v32;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Created MKM %{private}@, MKS %@, MKI %@ for the group %@, current: %@, next: %@, isFirstLocalGeneratedMKM: %@ for device %@", __buf, 0x52u);

        p_os_unfair_lock_t lock = v44;
        id v17 = v43;

        id v7 = v45;
      }

      os_unfair_lock_unlock(p_lock);
      [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v6 sessionID:v7];
      uint64_t mkmExpireDuration = self->_mkmExpireDuration;
      id v34 = [(IDSGroupEncryptionController1 *)self sessionController];
      id v35 = [v34 sessionWithUniqueID:v7];

      if (v35) {
        [v35 didCreateMKM:v17];
      }
      if (v47)
      {
        unsigned int mkmRollDuration = self->_mkmRollDuration;
        unsigned int v37 = self->_mkmExpireDuration;
        BOOL v38 = v37 >= mkmRollDuration;
        uint64_t v39 = v37 - mkmRollDuration;
        if (v38)
        {
          uint64_t mkmExpireDuration = v39;
        }
        else
        {
          id v40 = v7;
          uint64_t v41 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_1007153D4();
          }

          id v7 = v40;
        }
      }
      else
      {
        uint64_t v42 = self->_mkmRollDuration;
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1001A2D48;
        v52[3] = &unk_10097E418;
        v52[4] = self;
        id v53 = v6;
        id v54 = v7;
        [(IDSGroupEncryptionController1 *)self _startMkmRollTimer:v42 forGroupID:v53 block:v52];
      }
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1001A2E14;
      v48[3] = &unk_1009814A8;
      v48[4] = self;
      id v49 = v6;
      char v51 = v47;
      id v50 = v7;
      [(IDSGroupEncryptionController1 *)self _startMkmExpirationTimer:mkmExpireDuration forGroupID:v49 block:v48];

      id v9 = v46;
      goto LABEL_32;
    }
  }
  else
  {
    id v20 = objc_alloc((Class)IDSGroupEncryptionKeyMaterial);
    id v21 = +[NSUUID UUID];
    id v17 = [v20 initWithIndex:v21 groupID:v6 participantID:v11];

    if (v17) {
      goto LABEL_6;
    }
  }
  long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10071536C();
  }

  os_unfair_lock_unlock(p_lock);
LABEL_32:
}

- (id)createStableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(IDSGroupEncryptionController1 *)self _ensureGroupStableKeyMaterialCacheForGroup:v6];
  Value = 0;
  if (v6 && self->_groupIDToLocalParticipantID) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)self->_groupIDToLocalParticipantID, v6);
  }
  id v11 = [Value unsignedLongLongValue];
  id v12 = objc_alloc((Class)IDSGroupEncryptionKeyMaterial);
  __int16 v13 = +[NSUUID UUID];
  id v14 = [v12 initWithIndex:v13 groupID:v6 participantID:v11];

  if (v14)
  {
    [v9 setCurrentLocalStableKeyMaterial:v14];
    id v15 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v14 keyMaterial];
      id v17 = [v14 keySalt];
      int64_t v18 = [v14 keyIndex];
      uint64_t v19 = [v9 currentLocalStableKeyMaterial];
      [v9 previousLocalStableKeyMaterial];
      id v20 = v24 = v7;
      *(_DWORD *)buf = 138479107;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      __int16 v28 = v17;
      __int16 v29 = 2112;
      __int16 v30 = v18;
      __int16 v31 = 2112;
      id v32 = v6;
      __int16 v33 = 2112;
      id v34 = v19;
      __int16 v35 = 2112;
      BOOL v36 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created SKM %{private}@, SKS %@, SKI %@ for the group %@, current: %@, previous: %@", buf, 0x3Eu);

      id v7 = v24;
      p_os_unfair_lock_t lock = &self->_lock;
    }
    os_unfair_lock_unlock(p_lock);
    [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v6 sessionID:v7];
    id v21 = v14;
  }
  else
  {
    long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100715460();
    }

    os_unfair_lock_unlock(p_lock);
  }

  return v14;
}

- (void)createStableKeyMaterialAndSendToFrameworkForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = [(IDSGroupEncryptionController1 *)self createStableKeyMaterialForGroup:a3 sessionID:v6];
  if (v7)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v9 = [(IDSGroupEncryptionController1 *)self sessionController];
    uint64_t v10 = [v9 sessionWithUniqueID:v6];

    id v11 = +[IDSFoundationLog RealTimeEncryptionController];
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "createStableKeyMaterialAndSendToFrameworkForGroup: send local SKM %@ to framework", buf, 0xCu);
      }

      id v12 = [v7 dictionaryRepresentation];
      id v14 = v12;
      __int16 v13 = +[NSArray arrayWithObjects:&v14 count:1];
      [v10 recvStableKeyMaterialForFrameworkCache:v13];
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_1007154C8();
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 groupID:(id)a5 sessionID:(id)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8
{
  LOBYTE(v8) = a8;
  [(IDSGroupEncryptionController1 *)self sendKeyMaterialsRecoveryRequestToDevice:a3 fromURI:a4 participantID:&off_1009D17A0 groupID:a5 sessionID:a6 requireMKM:a7 requireSKM:v8];
}

- (void)sendKeyMaterialsRecoveryRequestToDevice:(id)a3 fromURI:(id)a4 participantID:(id)a5 groupID:(id)a6 sessionID:(id)a7 requireMKM:(BOOL)a8 requireSKM:(BOOL)a9
{
  BOOL v56 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = im_primary_base_queue();
  dispatch_assert_queue_V2(v19);

  id v20 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v62 = v14;
    __int16 v63 = 2112;
    __int16 v64 = v15;
    __int16 v65 = 2112;
    id v66 = v17;
    __int16 v67 = 2112;
    id v68 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToDevice: %@ fromID: %@ groupID: %@ sessionID: %@", buf, 0x2Au);
  }

  uint64_t v21 = [(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyData];
  long long v22 = (void *)v21;
  if (v21)
  {
    v59[0] = IDSFanoutMessageGroupIDKey;
    v59[1] = IDSDSessionMessageSessionID;
    v60[0] = v17;
    v60[1] = v18;
    v60[2] = v21;
    v59[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
    v59[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    long long v23 = +[NSNumber numberWithInteger:[(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyWrappingMode]];
    v60[3] = v23;
    id v24 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];

    id v52 = v24;
    id v25 = [v24 mutableCopy];
    __int16 v26 = v25;
    if (v56) {
      [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionMKMRecoveryRequestKey];
    }
    id v27 = v18;
    id v54 = v16;
    if (a9) {
      [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionSKMRecoveryRequestKey];
    }
    __int16 v55 = v26;
    __int16 v28 = +[IDSDAccountController sharedInstance];
    __int16 v29 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v17];
    uint64_t v30 = [v28 accountWithUniqueID:v29];

    id v53 = (void *)v30;
    if (v30)
    {
      id v50 = v15;
      __int16 v31 = [v15 unprefixedURI];
      id v32 = sub_1003EA6DC(v31);
      __int16 v33 = +[IDSURI URIWithPrefixedURI:v32];

      char v51 = v14;
      id v49 = [v33 URIByAddingOptionalPushToken:v14];
      id v34 = +[NSSet setWithObject:](NSSet, "setWithObject:");
      uint64_t v35 = +[IDSDestination destinationWithDestinations:v34];

      [(IDSGroupEncryptionController1 *)self _multiwayFTMessageSendTimeout];
      LOBYTE(v47) = 0;
      uint64_t v48 = (void *)v35;
      id v18 = v27;
      -[IDSGroupEncryptionController1 _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:](self, "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:", v55, v35, v17, v27, 211, 1, v47, 0, 0);
      BOOL v36 = [(IDSGroupEncryptionController1 *)self sessionController];
      unsigned int v37 = [v36 sessionWithGroupID:v17];

      BOOL v38 = v52;
      if (!v37)
      {
        uint64_t v39 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v62 = v17;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToDevice: could not find session for group %@", buf, 0xCu);
        }
      }
      if (v54)
      {
        id v57 = v54;
        id v40 = +[NSArray arrayWithObjects:&v57 count:1];
      }
      else
      {
        __int16 v58 = v33;
        uint64_t v42 = +[NSArray arrayWithObjects:&v58 count:1];
        id v43 = +[NSSet setWithArray:v42];
        long long v44 = [(IDSGroupEncryptionController1 *)self participantIDsForURIs:v43 group:v17];
        id v40 = [v44 allObjects];
      }
      id v14 = v51;
      long long v45 = +[IDSFoundationLog RealTimeEncryptionController];
      id v15 = v50;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v62 = v17;
        __int16 v63 = 2112;
        __int16 v64 = v40;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToDevice: sending key recovery request for group %@ to participant IDs %@", buf, 0x16u);
      }

      if (v37 && v56) {
        [v37 requestMaterialsForParticipantIDs:v40 materialType:13];
      }
      if (v37 && a9) {
        [v37 requestMaterialsForParticipantIDs:v40 materialType:14];
      }
      long long v46 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412803;
        __int16 v62 = v33;
        __int16 v63 = 2113;
        __int16 v64 = v51;
        __int16 v65 = 2113;
        id v66 = v55;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToDevice: Sent the key recovery request to URI: (%@) (pushToken: %{private}@)(message dict: %{private}@)", buf, 0x20u);
      }

      id v16 = v54;
      uint64_t v41 = v53;
    }
    else
    {
      __int16 v33 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100715598();
      }
      id v16 = v54;
      id v18 = v27;
      BOOL v38 = v52;
      uint64_t v41 = 0;
    }
  }
  else
  {
    BOOL v38 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100715530();
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToGroup:(id)a3 requireMKM:(BOOL)a4 requireSKM:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = im_primary_base_queue();
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyData];
  id v11 = (void *)v10;
  if (v10)
  {
    v51[0] = IDSFanoutMessageGroupIDKey;
    v51[1] = IDSDSessionMessageSessionID;
    v52[0] = v8;
    v52[1] = v8;
    v52[2] = v10;
    v51[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
    v51[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    id v12 = +[NSNumber numberWithInteger:[(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyWrappingMode]];
    v52[3] = v12;
    __int16 v13 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];

    id v14 = [v13 mutableCopy];
    id v15 = v14;
    BOOL v16 = v6;
    if (v6) {
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionMKMRecoveryRequestKey];
    }
    BOOL v17 = v5;
    if (v5) {
      [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionSKMRecoveryRequestKey];
    }
    uint64_t v42 = v15;
    id v18 = +[IDSDAccountController sharedInstance];
    uint64_t v19 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v8];
    uint64_t v20 = [v18 accountWithUniqueID:v19];

    uint64_t v41 = (void *)v20;
    if (v20)
    {
      uint64_t v21 = [(NSMutableDictionary *)self->_membersForGroup objectForKeyedSubscript:v8];
      long long v22 = +[NSSet setWithArray:v21];

      uint64_t v23 = +[IDSDestination destinationWithDestinations:v22];
      id v24 = +[IDSFoundationLog RealTimeEncryptionController];
      BOOL v25 = v17;
      BOOL v26 = v16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v27 = @"NO";
        if (v16) {
          CFStringRef v28 = @"YES";
        }
        else {
          CFStringRef v28 = @"NO";
        }
        *(_DWORD *)buf = 138413059;
        if (v25) {
          CFStringRef v27 = @"YES";
        }
        id v44 = v8;
        __int16 v45 = 2112;
        CFStringRef v46 = v28;
        __int16 v47 = 2112;
        CFStringRef v48 = v27;
        __int16 v49 = 2113;
        id v50 = v42;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToGroup: %@ requireMKM: %@, requireSKM: %@, (message dict: %{private}@)", buf, 0x2Au);
      }

      [(IDSGroupEncryptionController1 *)self _multiwayFTMessageSendTimeout];
      LOBYTE(v40) = 0;
      __int16 v29 = (void *)v23;
      -[IDSGroupEncryptionController1 _sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:](self, "_sendMessage:toDestination:forGroup:sessionID:command:timeout:shouldExpire:useQR:completion:completionBlock:", v42, v23, v8, 0, 211, 1, v40, 0, 0);
      uint64_t v30 = [(IDSGroupEncryptionController1 *)self sessionController];
      __int16 v31 = [v30 sessionWithGroupID:v8];

      if (!v31)
      {
        id v32 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v8;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToGroup: could not find session for group %@", buf, 0xCu);
        }
      }
      __int16 v33 = [(IDSGroupEncryptionController1 *)self participantIDsForURIs:v22 group:v8];
      id v34 = [v33 allObjects];

      uint64_t v35 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v36 = @"NO";
        if (v26) {
          CFStringRef v37 = @"YES";
        }
        else {
          CFStringRef v37 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        if (v25) {
          CFStringRef v36 = @"YES";
        }
        id v44 = v8;
        __int16 v45 = 2112;
        CFStringRef v46 = v37;
        __int16 v47 = 2112;
        CFStringRef v48 = v36;
        __int16 v49 = 2112;
        id v50 = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToGroup: %@ requireMKM: %@, requireSKM: %@, participantIDs: %@", buf, 0x2Au);
      }

      if (v31 && v26) {
        [v31 requestMaterialsForParticipantIDs:v34 materialType:13];
      }
      BOOL v38 = v42;
      if (v31 && v25) {
        [v31 requestMaterialsForParticipantIDs:v34 materialType:14];
      }

      uint64_t v39 = v41;
    }
    else
    {
      long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10071566C();
      }
      uint64_t v39 = 0;
      BOOL v38 = v42;
    }
  }
  else
  {
    __int16 v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100715604();
    }
  }
}

- (void)sendKeyMaterialsRecoveryRequestToParticipants:(id)a3 groupID:(id)a4 sessionID:(id)a5 requireMKM:(BOOL)a6 requireSKM:(BOOL)a7
{
  BOOL v34 = a6;
  BOOL v35 = a7;
  id v10 = a3;
  id v11 = a4;
  id v36 = a5;
  os_unfair_lock_lock(&self->_lock);
  __int16 v33 = self;
  CFStringRef v37 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v11];
  id v12 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138413058;
    if (v34) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    CFStringRef v56 = v14;
    __int16 v57 = 2112;
    if (v35) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v58 = v13;
    __int16 v59 = 2112;
    id v60 = v10;
    __int16 v61 = 2112;
    __int16 v62 = v37;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsRecoveryRequestToParticipants: requireMKM: %@, requireSKM: %@, participantIDs: %@, participantsInfo: %@", buf, 0x2Au);
  }

  if (v10)
  {
    os_unfair_lock_t lock = &self->_lock;
    id v30 = v10;
    id v32 = v11;
    +[NSSet setWithArray:v10];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v48;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v20 = v37;
          id v21 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v44;
            while (2)
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v44 != v23) {
                  objc_enumerationMutation(v20);
                }
                BOOL v25 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                id v26 = [v25 participantIdentifier];
                if (v26 == [v19 unsignedLongLongValue])
                {
                  CFStringRef v27 = im_primary_queue();
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_1001A4488;
                  block[3] = &unk_100984A00;
                  void block[4] = v33;
                  void block[5] = v25;
                  id v39 = v32;
                  id v40 = v36;
                  BOOL v41 = v34;
                  BOOL v42 = v35;
                  dispatch_async(v27, block);

                  goto LABEL_24;
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
LABEL_24:
        }
        id v16 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v16);
    }
    os_unfair_lock_unlock(lock);

    id v10 = v30;
    id v11 = v32;
  }
  else
  {
    CFStringRef v28 = im_primary_queue();
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1001A4474;
    v51[3] = &unk_10097E440;
    void v51[4] = self;
    id v52 = v11;
    dispatch_async(v28, v51);

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)processIncomingKeyMaterialsRecoveryRequest:(id)a3 fromDevice:(id)a4 fromURI:(id)a5 groupID:(id)a6 sessionID:(id)a7 serverDate:(id)a8 requireMKM:(BOOL)a9 requireSKM:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = [(IDSGroupEncryptionController1 *)self sessionController];
  uint64_t v23 = [v22 sessionWithUniqueID:v20];

  id v24 = [(IDSGroupEncryptionController1 *)self sessionController];
  uint64_t v25 = [v24 sessionWithGroupID:v19];

  id v26 = (void *)v25;
  CFStringRef v27 = [v18 URIByAddingOptionalPushToken:v17];
  if ([v23 destinationsContainFromURI:v27]
    && ([v26 destinationsContainFromURI:v27] & 1) != 0)
  {
    long long v47 = v26;
    long long v48 = v18;
    long long v49 = v16;
    id v50 = v21;
    [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v19];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = [v28 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v52;
      while (2)
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v28);
          }
          if ([*(id *)(*((void *)&v51 + 1) + 8 * i) isEqual:v17])
          {

            long long v46 = [v49 objectForKeyedSubscript:IDSDSessionMessageRealTimeEncryptionPublicKey];
            long long v45 = [v49 _numberForKey:IDSDSessionMessageRealTimeEncryptionWrapModeKey];
            BOOL v35 = +[IDSFoundationLog RealTimeEncryptionController];
            id v18 = v48;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413571;
              id v57 = v19;
              __int16 v58 = 2112;
              id v59 = v20;
              __int16 v60 = 2112;
              id v61 = v50;
              __int16 v62 = 2112;
              id v63 = v17;
              __int16 v64 = 2112;
              __int16 v65 = v48;
              __int16 v66 = 2113;
              __int16 v67 = v49;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest for group %@, session %@, serverDate %@, pushToken: %@, fromID: %@, message %{private}@", buf, 0x3Eu);
            }

            id v36 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              ids_monotonic_time();
              *(_DWORD *)buf = 134217984;
              id v57 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Receiving Key Material (Push, KeyMaterialsRecovery) [PreKey] -- %f", buf, 0xCu);
            }

            -[IDSGroupEncryptionController1 setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:](self, "setRealTimeEncryptionPublicKey:forDevice:fromURI:groupID:sessionID:serverDate:wrapMode:", v46, v17, v48, v19, v20, v50, [v45 integerValue]);
            if (v23)
            {
              BOOL v38 = [v48 prefixedURI];
              id v39 = [v17 rawToken];
              +[IDSDestination destinationWithAlias:v38 pushToken:v39];
              uint64_t v40 = v44 = v20;

              [(IDSGroupEncryptionController1 *)self sendPublicKeyToDestination:v40 group:v19 sessionID:v44];
              id v55 = v17;
              BOOL v41 = +[NSArray arrayWithObjects:&v55 count:1];
              [(IDSGroupEncryptionController1 *)self requestKeyMaterialForGroup:v19 sessionID:v44 toSpecificMembers:v41 requireMKM:a9 requireSKM:a10];

              BOOL v42 = [v17 rawToken];
              [v23 reportPreKeyReceivedOverPushFromToken:v42];

              long long v43 = v40;
              id v20 = v44;
            }
            else
            {
              long long v43 = +[IDSFoundationLog RealTimeEncryptionController];
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v57 = v19;
                __int16 v58 = 2112;
                id v59 = v20;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest - there is no group session for group %@, session %@. We won't send any MKM/SKM.", buf, 0x16u);
              }
            }
            id v16 = v49;
            id v26 = v47;

            goto LABEL_26;
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v51 objects:v68 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    __int16 v33 = +[IDSFoundationLog RealTimeEncryptionController];
    id v26 = v47;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v19;
      __int16 v58 = 2112;
      id v59 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest: We'll drop this key recovery request for group [%@] since deviceToken [%@] is not in the active participant list!", buf, 0x16u);
    }

    [v23 rejectedKeyRecoveryRequestFromURI:v27 reason:2];
    id v18 = v48;
    id v16 = v49;
LABEL_26:

    id v21 = v50;
  }
  else
  {
    BOOL v34 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v19;
      __int16 v58 = 2112;
      id v59 = v27;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "processIncomingKeyMaterialsRecoveryRequest: We'll drop this prekey recovery request for group %@ since %@ is not in this group!", buf, 0x16u);
    }

    [v23 rejectedKeyRecoveryRequestFromURI:v27 reason:1];
  }
}

- (BOOL)_storePendingKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 hasValidMKM:(BOOL)a5 hasValidSKM:(BOOL)a6 forDevice:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v9)
  {
    id v16 = [(NSMutableDictionary *)self->_pendingMasterKeyMaterials objectForKeyedSubscript:v14];

    [(NSMutableDictionary *)self->_pendingMasterKeyMaterials setObject:v12 forKeyedSubscript:v14];
    if (!v16)
    {
      BOOL v9 = 1;
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
    id v17 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v12 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
      int v30 = 138412546;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_storePendingKeyMaterialForKeyRecovery: _pendingMasterKeyMaterials already has the pending key material (MKI:%@) for %@", (uint8_t *)&v30, 0x16u);
    }
    BOOL v9 = 0;
  }
  if (!v8) {
    goto LABEL_12;
  }
LABEL_7:
  id v19 = [(NSMutableDictionary *)self->_pendingStableKeyMaterials objectForKeyedSubscript:v14];

  pendingStableKeyMaterials = self->_pendingStableKeyMaterials;
  if (!v19)
  {
    [(NSMutableDictionary *)pendingStableKeyMaterials setObject:v12 forKeyedSubscript:v14];
    os_unfair_lock_unlock(&self->_lock);
    if (!v9)
    {
LABEL_19:
      CFStringRef v27 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v13 objectForKeyedSubscript:IDSRealTimeEncryptionSKI];
        int v30 = 138412290;
        uint64_t v31 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "_storePendingKeyMaterial: moved the incoming the stable key material (SKI:%@) to temporary storage until it gets the prekey for it.", (uint8_t *)&v30, 0xCu);
      }
LABEL_22:
      BOOL v24 = 1;
      goto LABEL_23;
    }
    int v23 = 1;
LABEL_13:
    uint64_t v25 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v12 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
      int v30 = 138412290;
      uint64_t v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "_storePendingKeyMaterial: moved the incoming the master key material (MKI:%@) to temporary storage until it gets the prekey for it.", (uint8_t *)&v30, 0xCu);
    }
    if (!v23) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  [(NSMutableDictionary *)pendingStableKeyMaterials setObject:v13 forKeyedSubscript:v14];
  id v21 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v13 objectForKeyedSubscript:IDSRealTimeEncryptionSKI];
    int v30 = 138412546;
    uint64_t v31 = v22;
    __int16 v32 = 2112;
    id v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "_storePendingKeyMaterial: _pendingStableKeyMaterials already has the pending key material (SKI:%@) for %@", (uint8_t *)&v30, 0x16u);
  }
LABEL_12:
  os_unfair_lock_unlock(p_lock);
  int v23 = 0;
  BOOL v24 = 0;
  if (v9) {
    goto LABEL_13;
  }
LABEL_23:

  return v24;
}

- (id)receivedAndSetKeyMaterial:(id)a3 stableKeyMaterial:(id)a4 forDevice:(id)a5 fromURI:(id)a6 groupID:(id)a7 sessionID:(id)a8 fromSender:(BOOL)a9 error:(id *)a10 forMKM:(BOOL)a11 forSKM:(BOOL)a12
{
  id v18 = a3;
  id v212 = a4;
  id v19 = (__CFString *)a5;
  id v213 = a6;
  id v20 = (__CFString *)a7;
  id v21 = a8;
  id v22 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = @"NO";
    id v24 = v21;
    if (a11) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    CFStringRef v26 = v19;
    if (a12) {
      CFStringRef v27 = @"YES";
    }
    else {
      CFStringRef v27 = @"NO";
    }
    if (a9) {
      CFStringRef v23 = @"YES";
    }
    CFStringRef v210 = v23;
    id v28 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice publicIdentityData];
    *(_DWORD *)buf = 138480131;
    id v224 = v18;
    __int16 v225 = 2113;
    id v226 = v212;
    __int16 v227 = 2112;
    v228 = (__SecKey *)v25;
    id v21 = v24;
    __int16 v229 = 2112;
    CFStringRef v230 = v27;
    id v19 = (__CFString *)v26;
    __int16 v231 = 2112;
    CFStringRef v232 = v26;
    __int16 v233 = 2112;
    uint64_t v234 = (uint64_t)v213;
    __int16 v235 = 2112;
    CFStringRef v236 = v20;
    __int16 v237 = 2112;
    id v238 = v24;
    __int16 v239 = 2112;
    CFStringRef v240 = v210;
    __int16 v241 = 2112;
    v242 = v28;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: %{private}@ SKM: %{private}@ for MKM: %@, for SKM: %@, forDevice: %@ fromID: %@ groupID: %@ sessionID: %@ fromSender: %@ publicKey: %@", buf, 0x66u);
  }
  id v29 = [(IDSGroupEncryptionController1 *)self sessionController];
  int v30 = [v29 sessionWithUniqueID:v21];

  v211 = v18;
  if (v30)
  {
    uint64_t v31 = [v213 URIByAddingOptionalPushToken:v19];
    unsigned __int8 v32 = [v30 destinationsContainFromURI:v31];

    if ((v32 & 1) == 0)
    {
      id v33 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        id v224 = v211;
        __int16 v225 = 2112;
        id v226 = v20;
        long long v46 = "receivedAndSetKeyMaterial: Invalid session or invalid destination. We'll drop this MKM %{private}@ for group %@";
        goto LABEL_26;
      }
LABEL_27:
      id v47 = 0;
      long long v48 = v212;
      goto LABEL_215;
    }
  }
  if (([v30 sharedSessionHasJoined] & 1) == 0)
  {
    id v33 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v224 = v211;
      __int16 v225 = 2112;
      id v226 = v20;
      long long v46 = "receivedAndSetKeyMaterial: Local has not joined. We'll drop this MKM %{private}@ for group %@";
LABEL_26:
      _os_log_impl((void *)&_mh_execute_header, &v33->super, OS_LOG_TYPE_DEFAULT, v46, buf, 0x16u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  id v33 = self->_identityForDevice;
  if (!v33)
  {
    long long v49 = +[IDSFoundationLog RealTimeEncryptionController];
    long long v48 = v212;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
      sub_1007156D8();
    }
    id v47 = 0;
    goto LABEL_214;
  }
  v204 = v19;
  v200 = objc_alloc_init((Class)NSMutableDictionary);
  if (a11)
  {
    [(IDSGroupEncryptionController1 *)self cleanUpExpiredMasterKeyMaterial];
    v199 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionMKM];
    BOOL v34 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionMKS];
    BOOL v35 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionMKGC];
    unsigned int v184 = [v35 unsignedIntValue];

    id v36 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionParticipantID];
    CFStringRef v201 = (const __CFString *)[v36 unsignedLongLongValue];

    v196 = v34;
    if ([v34 length] == (id)16)
    {
      CFStringRef v37 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
      if ([v37 length] == (id)16)
      {
        v197 = v37;
        id v38 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", -[NSObject bytes](v37, "bytes"));
        id v39 = [(IDSGroupEncryptionController1 *)self masterKeyMaterialForGroup:v20];
        v203 = v38;
        v194 = v39;
        if (v39
          && ([v39 keyIndex],
              uint64_t v40 = objc_claimAutoreleasedReturnValue(),
              unsigned int v41 = [v40 isEqual:v38],
              v40,
              v41))
        {
          BOOL v42 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = [v203 UUIDString];
            *(_DWORD *)buf = 138412290;
            id v224 = v43;
            id v44 = v42;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This MKI %@ is local key material. skipping...", buf, 0xCu);

            int v45 = 0;
          }
          else
          {
            int v45 = 0;
            id v44 = v42;
          }
        }
        else
        {
          id v190 = v21;
          os_unfair_lock_lock(&self->_lock);
          uint64_t v51 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v20];
          long long v52 = [v38 UUIDString];
          unsigned int v53 = [(id)v51 hasClientReceivedMasterKeyIdentifier:v52];

          long long v54 = [v38 UUIDString];
          id v44 = (void *)v51;
          LODWORD(v51) = [(id)v51 hasCachedMasterKeyIdentifier:v54];

          os_unfair_lock_unlock(&self->_lock);
          int v55 = v51 & v53;
          if ((v51 & v53) == 1)
          {
            CFStringRef v56 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              id v57 = [v38 UUIDString];
              *(_DWORD *)buf = 138412290;
              id v224 = v57;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: has cached MKM. {MKI: %@}", buf, 0xCu);
            }
          }
          int v45 = v55 ^ 1;
          id v21 = v190;
        }
        id v50 = v194;

        CFStringRef v37 = v197;
      }
      else
      {
        id v50 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v224 = v37;
          __int16 v225 = 1024;
          LODWORD(v226) = 16;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This MKI UUID data %@ is not %d bytes. skipping...", buf, 0x12u);
        }
        int v45 = 0;
        v203 = 0;
      }
    }
    else
    {
      CFStringRef v37 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v224 = v196;
        __int16 v225 = 1024;
        LODWORD(v226) = 16;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This MKS data %@ is not %d bytes. skipping...", buf, 0x12u);
      }
      int v45 = 0;
      v203 = 0;
    }

    id v19 = v204;
  }
  else
  {
    v199 = 0;
    v196 = 0;
    int v45 = 0;
    CFStringRef v201 = 0;
    v203 = 0;
    unsigned int v184 = 0;
  }
  int v185 = IMGetDomainBoolForKey();
  unsigned int v198 = v45;
  v189 = v33;
  if (!a12)
  {
    v193 = 0;
    v195 = 0;
    unsigned int v70 = 0;
    __int16 v69 = 0;
    unint64_t v60 = 0;
    goto LABEL_71;
  }
  v193 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKM];
  __int16 v58 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKS];
  id v59 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKGC];
  unint64_t v60 = (unint64_t)[v59 unsignedIntValue];

  id v61 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionParticipantID];
  CFStringRef v201 = (const __CFString *)[v61 unsignedLongLongValue];

  v195 = v58;
  if ([v58 length] != (id)16)
  {
    __int16 v62 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v224 = v195;
      __int16 v225 = 1024;
      LODWORD(v226) = 16;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This SKS data %@ is not %d bytes. skipping...", buf, 0x12u);
    }
    unsigned int v70 = 0;
    __int16 v69 = 0;
    int v45 = v198;
    goto LABEL_70;
  }
  __int16 v62 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKI];
  if ([v62 length] != (id)16)
  {
    __int16 v71 = +[IDSFoundationLog RealTimeEncryptionController];
    v182 = v71;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v224 = v62;
      __int16 v225 = 1024;
      LODWORD(v226) = 16;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This SKI UUID data %@ is not %d bytes. skipping...", buf, 0x12u);
    }
    unsigned int v70 = 0;
    __int16 v69 = 0;
    int v45 = v198;
    goto LABEL_69;
  }
  unsigned int v180 = v60;
  id v63 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", -[NSObject bytes](v62, "bytes"));
  __int16 v64 = [(IDSGroupEncryptionController1 *)self stableKeyMaterialForGroup:v20 sessionID:v21];
  v182 = v64;
  if (v64
    && ([v64 keyIndex],
        __int16 v65 = objc_claimAutoreleasedReturnValue(),
        unsigned int v66 = [v65 isEqual:v63],
        v65,
        v66))
  {
    __int16 v67 = +[IDSFoundationLog RealTimeEncryptionController];
    v177 = v67;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = [v63 UUIDString];
      *(_DWORD *)buf = 138412290;
      id v224 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: This SKI %@ is local key. skipping...", buf, 0xCu);

      __int16 v69 = v63;
      unsigned int v70 = 0;
    }
    else
    {
      unsigned int v70 = 0;
      __int16 v69 = v63;
    }
  }
  else
  {
    id v191 = v21;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v72 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v20];
    __int16 v73 = [v63 UUIDString];
    unsigned int v74 = [(id)v72 hasClientReceivedStableKeyIdentifier:v73];

    v187 = v63;
    __int16 v75 = [v63 UUIDString];
    v177 = (void *)v72;
    LODWORD(v72) = [(id)v72 hasCachedStableKeyIdentifier:v75];

    os_unfair_lock_unlock(&self->_lock);
    unsigned int v70 = v72 & v74 ^ 1 | v185;
    if ((v70 & 1) == 0)
    {
      CFStringRef v76 = +[IDSFoundationLog RealTimeEncryptionController];
      unint64_t v60 = v180;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v77 = [v187 UUIDString];
        *(_DWORD *)buf = 138412290;
        id v224 = v77;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: has cached SKM. {SKI: %@}", buf, 0xCu);
      }
      unsigned int v70 = 0;
      id v21 = v191;
      __int16 v69 = v187;
      goto LABEL_68;
    }
    id v21 = v191;
    __int16 v69 = v63;
  }
  unint64_t v60 = v180;
LABEL_68:
  int v45 = v198;

LABEL_69:
LABEL_70:

  id v19 = v204;
LABEL_71:
  if (((v45 | v70) & 1) == 0)
  {
    unsigned int v80 = +[IDSFoundationLog RealTimeEncryptionController];
    v207 = v80;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: not received any valid MKM or SKM", buf, 2u);
    }
    id v47 = 0;
    long long v48 = v212;
    long long v49 = v200;
    id v33 = v189;
    goto LABEL_213;
  }
  unsigned int v183 = v70;
  v186 = self;
  v188 = v69;
  id v192 = v21;
  unsigned int v181 = v60;
  if ([(IDSGroupEncryptionController1 *)self isTestRunning])
  {
    v207 = [v199 mutableCopy];
    id v78 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v224 = v199;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: the simulator can't decrypt protectedMKMData %@", buf, 0xCu);
    }

    id v205 = 0;
    CFStringRef v79 = v201;
    id v33 = v189;
    goto LABEL_191;
  }
  if (a11 || a12)
  {
    if (a11) {
      __int16 v81 = v211;
    }
    else {
      __int16 v81 = v212;
    }
    id v82 = [v81 _numberForKey:IDSDSessionMessageRealTimeEncryptionWrapModeKey];
    uint64_t v208 = [v82 integerValue] == (id)1;
  }
  else
  {
    uint64_t v208 = -1;
  }
  id v33 = v189;
  id v83 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    v206 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice publicIdentity];
    if (v198) {
      CFStringRef v84 = @"YES";
    }
    else {
      CFStringRef v84 = @"NO";
    }
    if (v183) {
      CFStringRef v85 = @"YES";
    }
    else {
      CFStringRef v85 = @"NO";
    }
    if (v203)
    {
      CFStringRef v86 = [v203 UUIDString];
    }
    else
    {
      CFStringRef v86 = 0;
    }
    if (v69)
    {
      __int16 v87 = [v69 UUIDString];
    }
    else
    {
      __int16 v87 = 0;
    }
    *(_DWORD *)buf = 138413826;
    id v224 = v206;
    __int16 v225 = 2112;
    id v226 = (id)v84;
    __int16 v227 = 2112;
    v228 = (__SecKey *)v85;
    __int16 v229 = 2112;
    CFStringRef v230 = v86;
    __int16 v231 = 2112;
    CFStringRef v232 = v87;
    __int16 v233 = 2048;
    uint64_t v234 = v208;
    __int16 v235 = 2048;
    CFStringRef v236 = v201;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: local pub key: %@, receivedValidMKM: %@, receivedValidSKM: %@, MKI: %@, SKI: %@ wrapMode: %llu, participantID: %llu", buf, 0x48u);
    if (v69) {

    }
    id v19 = v204;
    self = v186;
    if (v203) {
  }
    }
  unsigned int v88 = v198;
  if (v198)
  {
    __int16 v89 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice fullIdentity];
    id v220 = 0;
    uint64_t v90 = +[GFTKeyWrapping unwrapSeed:v199 usingKey:v89 legacy:v208 == 0 error:&v220];
    id v91 = v220;
    id v92 = v91;
    if ((!v90 || v91) && self->_previousIdentityForDevice)
    {
      CFTypeRef v93 = v91;
      v178 = (void *)v90;
      __int16 v94 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v95 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice publicIdentity];
        CFStringRef v96 = [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice publicIdentity];
        *(_DWORD *)buf = 138412802;
        id v224 = v93;
        __int16 v225 = 2112;
        id v226 = v95;
        __int16 v227 = 2112;
        v228 = v96;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: MKM: failed SecMWCopyUnwrappedSessionSeed (error: %@) local pub key %@, but try again using the previous identity %@", buf, 0x20u);
      }

      unsigned int v97 = [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice fullIdentity];
      id v219 = 0;
      uint64_t v90 = +[GFTKeyWrapping unwrapSeed:v199 usingKey:v97 legacy:v208 == 0 error:&v219];
      id v92 = v219;
    }
    unsigned int v88 = v198;
  }
  else
  {
    id v92 = 0;
    uint64_t v90 = 0;
  }
  v176 = v92;
  v179 = (void *)v90;
  unsigned int v98 = v183;
  if (v183)
  {
    CFStringRef v99 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice fullIdentity];
    id v218 = 0;
    v100 = +[GFTKeyWrapping unwrapSeed:v193 usingKey:v99 legacy:v208 == 0 error:&v218];
    id v101 = v218;
    if ((!v100 || v101) && self->_previousIdentityForDevice)
    {
      v174 = v101;
      v102 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        int v103 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice publicIdentity];
        v104 = [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice publicIdentity];
        *(_DWORD *)buf = 138412802;
        id v224 = v174;
        __int16 v225 = 2112;
        id v226 = v103;
        __int16 v227 = 2112;
        v228 = v104;
        _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: SKM: failed SecMWCopyUnwrappedSessionSeed (error: %@) local pub key %@, but try again using the previous identity %@", buf, 0x20u);
      }

      CFStringRef v105 = [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice fullIdentity];
      id v217 = 0;
      uint64_t v106 = +[GFTKeyWrapping unwrapSeed:v100 usingKey:v105 legacy:v208 == 0 error:&v217];
      id v107 = v217;

      id v101 = v107;
      v100 = (void *)v106;
    }
    id v92 = v176;
    uint64_t v90 = (uint64_t)v179;
    unsigned int v98 = v183;
    if (!v198) {
      goto LABEL_120;
    }
LABEL_122:
    if (v90) {
      BOOL v109 = v92 == 0;
    }
    else {
      BOOL v109 = 0;
    }
    int v108 = !v109;
    goto LABEL_128;
  }
  id v101 = 0;
  v100 = 0;
  if (v88) {
    goto LABEL_122;
  }
LABEL_120:
  int v108 = 0;
LABEL_128:
  v173 = v100;
  if (v98)
  {
    if (v100) {
      BOOL v110 = v101 == 0;
    }
    else {
      BOOL v110 = 0;
    }
    int v111 = !v110;
  }
  else
  {
    int v111 = 0;
  }
  v175 = v101;
  if (byte_100A4A900) {
    int v112 = 1;
  }
  else {
    int v112 = v108;
  }
  char v172 = v112 | v111;
  if ((v112 | v111) == 1)
  {
    if (byte_100A4A900)
    {
      CFStringRef v113 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: force starting the key recovery logic on this device", buf, 2u);
      }

      byte_100A4A900 = 0;
    }
    id v114 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v115 = [(IDSRealTimeEncryptionIdentity *)v186->_identityForDevice publicIdentity];
      CFStringRef v116 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v224 = v176;
      if (v108) {
        CFStringRef v117 = @"YES";
      }
      else {
        CFStringRef v117 = @"NO";
      }
      __int16 v225 = 2112;
      id v226 = v175;
      if (v111) {
        CFStringRef v116 = @"YES";
      }
      __int16 v227 = 2112;
      v228 = v115;
      __int16 v229 = 2112;
      CFStringRef v230 = v117;
      __int16 v231 = 2112;
      CFStringRef v232 = v116;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: failed SecMWCopyUnwrappedSessionSeed (MKMError: %@, SKMError: %@) local pub key %@ (MKMProcessingFailed: %@, SKMProcessingFailed: %@)", buf, 0x34u);
    }

    id v209 = [v211 mutableCopy];
    uint64_t v118 = v198;
    if (v209) {
      unsigned int v119 = v198;
    }
    else {
      unsigned int v119 = 0;
    }
    if (v119 == 1)
    {
      [v209 setObject:v213 forKeyedSubscript:IDSGroupSessionMessagesFromIDKey];
      [v209 setObject:v20 forKeyedSubscript:IDSGroupSessionMessagesGroupIDKey];
      [v209 setObject:v192 forKeyedSubscript:IDSDSessionMessageSessionID];
      v120 = +[NSNumber numberWithUnsignedLongLong:v201];
      [v209 setObject:v120 forKeyedSubscript:IDSRealTimeEncryptionParticipantID];

      uint64_t v118 = v198;
    }
    id v121 = [v212 mutableCopy];
    v122 = v121;
    uint64_t v123 = v183;
    if (v121) {
      unsigned int v124 = v183;
    }
    else {
      unsigned int v124 = 0;
    }
    if (v124 == 1)
    {
      [v121 setObject:v213 forKeyedSubscript:IDSGroupSessionMessagesFromIDKey];
      [v122 setObject:v20 forKeyedSubscript:IDSGroupSessionMessagesGroupIDKey];
      [v122 setObject:v192 forKeyedSubscript:IDSDSessionMessageSessionID];
      v125 = +[NSNumber numberWithUnsignedLongLong:v201];
      [v122 setObject:v125 forKeyedSubscript:IDSRealTimeEncryptionParticipantID];

      uint64_t v123 = v183;
      uint64_t v118 = v198;
    }
    id v19 = v204;
    if (a9
      && -[IDSGroupEncryptionController1 _storePendingKeyMaterial:stableKeyMaterial:hasValidMKM:hasValidSKM:forDevice:](v186, "_storePendingKeyMaterial:stableKeyMaterial:hasValidMKM:hasValidSKM:forDevice:", v209, v122, v118, v123, v204)&& (-[NSMutableDictionary objectForKeyedSubscript:](v186->_participantsForGroup, "objectForKeyedSubscript:", v20), v126 = objc_claimAutoreleasedReturnValue(), unsigned int v127 = [v126 containsObject:v204], v126, v127))
    {
      realtimeEncryptionQueue = v186->_realtimeEncryptionQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001A6AD4;
      block[3] = &unk_10097E418;
      void block[4] = v186;
      v215 = v204;
      v216 = v20;
      dispatch_async(realtimeEncryptionQueue, block);

      id v21 = v192;
      __int16 v69 = v188;
    }
    else
    {
      id v134 = +[IDSFoundationLog RealTimeEncryptionController];
      id v21 = v192;
      __int16 v69 = v188;
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        if (v211)
        {
          v135 = [v211 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
        }
        else
        {
          v135 = 0;
        }
        if (v212)
        {
          BOOL v136 = [v212 objectForKeyedSubscript:IDSRealTimeEncryptionSKI];
        }
        else
        {
          BOOL v136 = 0;
        }
        CFStringRef v137 = @"NO";
        *(_DWORD *)buf = 138412802;
        id v224 = v135;
        __int16 v225 = 2112;
        if (a9) {
          CFStringRef v137 = @"YES";
        }
        id v226 = v136;
        __int16 v227 = 2112;
        v228 = (__SecKey *)v137;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: skip _startKeyRecoveryForMKM for MKI %@ SKI: %@. this is already in the pending key material list, or, it's not from the key owner.(fromSender: %@)", buf, 0x20u);
        if (v212) {

        }
        if (v211) {
        id v21 = v192;
        }
        __int16 v69 = v188;
      }
    }
    if (a10)
    {
      id v138 = v21;
      v139 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: setting error", buf, 2u);
      }

      NSErrorUserInfoKey v221 = NSDebugDescriptionErrorKey;
      CFStringRef v222 = @"Failed to decrypt key material";
      id v140 = +[NSDictionary dictionaryWithObjects:&v222 forKeys:&v221 count:1];
      *a10 = +[NSError errorWithDomain:@"IDSRealTimeEncryptionControllerErrorDomain" code:-2000 userInfo:v140];

      id v21 = v138;
      __int16 v69 = v188;
    }

    id v205 = 0;
    v207 = 0;
    v132 = v179;
    char v133 = v173;
  }
  else
  {
    os_unfair_lock_lock(&v186->_lock);
    [(NSMutableDictionary *)v186->_pendingMasterKeyMaterials setObject:0 forKeyedSubscript:v19];
    [(NSMutableDictionary *)v186->_pendingStableKeyMaterials setObject:0 forKeyedSubscript:v19];
    os_unfair_lock_unlock(&v186->_lock);
    v129 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
    {
      pendingMasterKeyMaterials = v186->_pendingMasterKeyMaterials;
      pendingStableKeyMaterials = v186->_pendingStableKeyMaterials;
      *(_DWORD *)buf = 138412802;
      id v224 = v19;
      __int16 v225 = 2112;
      id v226 = pendingMasterKeyMaterials;
      __int16 v227 = 2112;
      v228 = (__SecKey *)pendingStableKeyMaterials;
      _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: SecMWCopyUnwrappedSessionSeed succeeded. Removed the pending key material for %@ (_pendingMasterKeyMaterials: %@), _pendingStableKeyMaterials: %@", buf, 0x20u);
    }

    v132 = v179;
    v207 = v179;
    char v133 = v173;
    id v205 = v173;
    id v21 = v192;
    __int16 v69 = v188;
  }

  if ((v172 & 1) == 0)
  {
    CFStringRef v79 = v201;
    unint64_t v60 = v181;
LABEL_191:
    if (v207)
    {
      v141 = v203;
      id v142 = [objc_alloc((Class)IDSGroupEncryptionKeyMaterial) initWithKeyMaterial:v207 keySalt:v196 keyIndex:v203 groupID:v20 generationCounter:v184 participantID:v79];
      v143 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        v144 = [v142 keyMaterial];
        unsigned int v145 = [v142 keySalt];
        v146 = [v142 keyIndex];
        *(_DWORD *)buf = 138478595;
        id v224 = v144;
        __int16 v225 = 2112;
        id v226 = v145;
        __int16 v227 = 2112;
        v228 = v146;
        __int16 v229 = 2048;
        CFStringRef v230 = v79;
        _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: done: MKM: %{private}@ MKS: %@ MKI: %@, participantID: %llu", buf, 0x2Au);

        v141 = v203;
      }

      [v200 setObject:v142 forKeyedSubscript:@"ids-rtencryption-master-key-material-key"];
      p_os_unfair_lock_t lock = &v186->_lock;
      os_unfair_lock_lock(&v186->_lock);
      v148 = [(NSMutableDictionary *)v186->_groupIDToKeyMaterialCache objectForKeyedSubscript:v20];
      if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform])
      {
        [v148 noteReceivedFirstKeyMaterial:v142 forRemoteParticipant:v79];
      }
      CFStringRef v202 = v79;
      [v141 UUIDString];
      long long v150 = v149 = v141;
      unsigned __int8 v151 = [v148 hasClientReceivedMasterKeyIdentifier:v150];

      if (v151)
      {
        os_unfair_lock_unlock(p_lock);
        long long v152 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
        {
          long long v153 = [v142 keyIndex];
          *(_DWORD *)buf = 138412290;
          id v224 = v153;
          _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: not delivering key material to client -- already delivered MKI: %@", buf, 0xCu);
        }
      }
      else
      {
        long long v154 = [v149 UUIDString];
        [v148 noteClientReceiptOfMasterKeyIdentifier:v154];

        os_unfair_lock_unlock(p_lock);
        [v30 recvKeyMaterial:v142];
        [v142 setIsSentToClient:1];
      }
      CFStringRef v79 = v202;
      unint64_t v60 = v181;
      [(IDSGroupEncryptionController1 *)v186 requestPendingKeyMaterialsForGroup:v20 sessionID:v192];

      id v19 = v204;
      __int16 v69 = v188;
    }
    if (v205)
    {
      id v155 = [objc_alloc((Class)IDSGroupEncryptionKeyMaterial) initWithKeyMaterial:v205 keySalt:v195 keyIndex:v69 groupID:v20 generationCounter:v60 participantID:v79];
      long long v156 = +[IDSFoundationLog RealTimeEncryptionController];
      CFStringRef v157 = v79;
      v158 = v200;
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v159 = [v155 keyMaterial];
        v160 = [v155 keySalt];
        [v155 keyIndex];
        id v161 = v155;
        id v162 = (__SecKey *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478595;
        id v224 = v159;
        __int16 v225 = 2112;
        id v226 = v160;
        __int16 v227 = 2112;
        v228 = v162;
        __int16 v229 = 2048;
        CFStringRef v230 = v157;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: done: SKM: %{private}@ SKS: %@ SKI: %@, participantID: %llu", buf, 0x2Au);

        id v155 = v161;
        v158 = v200;
      }
      [v158 setObject:v155 forKeyedSubscript:@"ids-rtencryption-stable-key-material-key"];
      v163 = &v186->_lock;
      os_unfair_lock_lock(&v186->_lock);
      v164 = [(NSMutableDictionary *)v186->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v20];
      v165 = [v188 UUIDString];
      v166 = v155;
      unsigned int v167 = [v164 hasClientReceivedStableKeyIdentifier:v165];

      if ((v167 ^ 1 | v185) == 1)
      {
        CFStringRef v168 = [v188 UUIDString];
        [v164 noteClientReceiptOfStableKeyIdentifier:v168];

        [v166 setIsSentToClient:1];
        os_unfair_lock_unlock(v163);
        [(IDSGroupEncryptionController1 *)v186 notifyStableKeyMaterialsReceivedForGroup:v20 sessionID:v192];
      }
      else
      {
        os_unfair_lock_unlock(v163);
        __int16 v169 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v170 = [v166 keyIndex];
          *(_DWORD *)buf = 138412290;
          id v224 = v170;
          _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "receivedAndSetKeyMaterial: not delivering key material to client -- already delivered SKI: %@", buf, 0xCu);
        }
      }

      id v19 = v204;
      __int16 v69 = v188;
    }
    long long v49 = v200;
    id v47 = [v200 copy];
    id v21 = v192;
    goto LABEL_212;
  }
  id v47 = 0;
  long long v49 = v200;
LABEL_212:

  long long v48 = v212;
LABEL_213:

LABEL_214:
LABEL_215:

  return v47;
}

- (void)requestPendingKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IDSGroupEncryptionController1 *)self sessionController];
  BOOL v9 = [v8 sessionWithUniqueID:v7];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
    id v11 = [v10 cachedMasterKeyMaterialCollection];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = [v11 masterKeyMaterials];
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v17 isGeneratedLocally] & 1) == 0
            && ([v17 isSentToClient] & 1) == 0)
          {
            [v9 recvKeyMaterial:v17];
            [v17 setIsSentToClient:1];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v11 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100715718();
    }
  }
}

- (void)noteReceivedGroupMasterKeyMaterials:(id)a3 URIs:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IDSGroupEncryptionController1 *)self sessionController];
  id v12 = [v11 sessionWithUniqueID:v10];

  if (v12)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (v8 && v9)
    {
      id v14 = [v12 groupID];
      uint64_t v15 = [(IDSGroupEncryptionController1 *)self _locked_ensureGroupMasterKeyMaterialCacheForGroup:v14];

      id v16 = [IDSGroupMasterKeyMaterialCollection alloc];
      id v17 = +[NSSet setWithArray:v9];
      long long v18 = [(IDSGroupMasterKeyMaterialCollection *)v16 initWithMasterKeyMaterials:v8 membershipURIs:v17];

      [v15 noteReceivedGroupMasterKeyMaterialCollection:v18];
      long long v19 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [v12 groupID];
        int v22 = 138412546;
        id v23 = v15;
        __int16 v24 = 2112;
        CFStringRef v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "noteReceivedGroupMasterKeyMaterials: updated the cache %@ for the group %@", (uint8_t *)&v22, 0x16u);
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    long long v21 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "noteReceivedGroupMasterKeyMaterials: couldn't find the session %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)receivedGroupStableKeyMaterial:(id)a3 fromPushToken:(id)a4 sessionID:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(IDSGroupEncryptionController1 *)self sessionController];
  uint64_t v15 = [v14 sessionWithUniqueID:v12];

  if (v15)
  {
    os_unfair_lock_lock(&self->_lock);
    if (v10)
    {
      id v16 = [v15 groupID];
      id v17 = [(IDSGroupEncryptionController1 *)self _ensureGroupStableKeyMaterialCacheForGroup:v16];

      id v24 = v11;
      long long v18 = [v17 updateGroupStableKeyMaterialCacheForPushToken:v11 SKM:v10];
      long long v19 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [v15 groupID];
        *(_DWORD *)buf = 138412546;
        id v27 = v17;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "receivedGroupStableKeyMaterials: updated the cache %@ for the group %@", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_lock);
      long long v21 = [v10 dictionaryRepresentation];
      CFStringRef v25 = v21;
      int v22 = +[NSArray arrayWithObjects:&v25 count:1];
      [v15 recvStableKeyMaterialForFrameworkCache:v22];

      id v11 = v24;
      if (v18)
      {
        [v15 hasOutdatedSKI:v18];
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    [(IDSGroupEncryptionController1 *)self notifyStableKeyMaterialsReceivedForGroup:v13 sessionID:v12];
  }
  else
  {
    id v23 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "receivedGroupStableKeyMaterials: couldn't find the session %@", buf, 0xCu);
    }
  }
}

- (void)notifyStableKeyMaterialsReceivedForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSGroupEncryptionController1 *)self sessionController];
  id v9 = [v8 sessionWithUniqueID:v7];

  if (v9)
  {
    CFStringRef v26 = v9;
    id v27 = v6;
    id v10 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v6];
    id v11 = [v10 cachedStableKeyMaterialCollection];

    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v11 stableKeyMaterials];
      *(_DWORD *)buf = 138412290;
      BOOL v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "notifyStableKeyMaterialsReceivedForGroup: keyMaterialCollection.stableKeyMaterials: %@", buf, 0xCu);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CFStringRef v25 = v11;
    uint64_t v15 = [v11 stableKeyMaterials];
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v20 isSentToClient] & 1) == 0)
          {
            long long v21 = [v20 dictionaryRepresentation];
            [v12 addObject:v21];

            [v20 setIsSentToClient:1];
            int v22 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              BOOL v34 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "notifyStableKeyMaterialsReceivedForGroup: add stableKeyMaterial: %@ to updateArray", buf, 0xCu);
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    id v9 = v26;
    if ([v12 count])
    {
      id v23 = [v12 copy];
      [v26 recvStableKeyMaterialForFrameworkCache:v23];
    }
    id v6 = v27;
    id v24 = v25;
  }
  else
  {
    id v24 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100715780();
    }
  }
}

- (id)masterKeyMaterialForGroup:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 currentLocalMasterKeyMaterial];
  id v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_9;
    }
    id v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      id v10 = "We don't have any key material for the group %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v9 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      id v10 = "We never got the key material for the group %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)stableKeyMaterialForGroup:(id)a3 sessionID:(id)a4
{
  id v5 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 currentLocalStableKeyMaterial];
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_9;
    }
    id v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      id v11 = "We don't have any stable key material for the group %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v10 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      id v11 = "We never got the stable key material for the group %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)sendPendingKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 forDevice:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v15 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    pendingMasterKeyMaterials = self->_pendingMasterKeyMaterials;
    *(_DWORD *)buf = 138412546;
    id v24 = v10;
    __int16 v25 = 2112;
    CFStringRef v26 = pendingMasterKeyMaterials;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sendPendingKeyMaterialsToGroup: %@, pendingMasterKeyMaterials: %@", buf, 0x16u);
  }

  id v17 = [(NSMutableDictionary *)self->_pendingMasterKeyMaterials objectForKeyedSubscript:v12];
  if (v17)
  {
    [(NSMutableDictionary *)self->_pendingMasterKeyMaterials setObject:0 forKeyedSubscript:v12];
    uint64_t v18 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      CFStringRef v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sendPendingKeyMaterialsToGroup: %@ - found the pending key %@", buf, 0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
    LOWORD(v22) = 1;
    LOBYTE(v21) = 1;
    id v19 = -[IDSGroupEncryptionController1 receivedAndSetKeyMaterial:stableKeyMaterial:forDevice:fromURI:groupID:sessionID:fromSender:error:forMKM:forSKM:](self, "receivedAndSetKeyMaterial:stableKeyMaterial:forDevice:fromURI:groupID:sessionID:fromSender:error:forMKM:forSKM:", v17, 0, v12, v13, v10, v11, v21, 0, v22);
  }
  else
  {
    long long v20 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendPendingKeyMaterialsToGroup: %@ - didn't find any pending keys.", buf, 0xCu);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_protectedCachedKeyMaterialsForDestination:(id)a3 pushToken:(id)a4 forGroup:(id)a5 outURIs:(id *)a6 includePeers:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  __int16 v65 = a4;
  id v12 = a5;
  os_unfair_lock_lock(&self->_lock);
  __int16 v64 = self;
  unint64_t v60 = v12;
  id v13 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v12];
  id v14 = [v13 currentLocalMasterKeyMaterial];
  if (v7) {
    [v13 groupMasterKeyCollectionToBroadcastForDestinationURI:v11];
  }
  else {
  id v61 = [v13 localMasterKeyCollectionToBroadcastForDestinationURI:v11];
  }
  id v59 = v13;
  if (!v61)
  {
    os_unfair_lock_unlock(&self->_lock);
    long long v28 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v84 = v11;
      __int16 v85 = 2112;
      CFStringRef v86 = v13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "_protectedCachedKeyMaterialsForDestination: keyMaterialCollection is nil for %@ (%@)!", buf, 0x16u);
    }
    long long v54 = 0;
    goto LABEL_57;
  }
  os_unfair_lock_t lock = &self->_lock;
  id v63 = v14;
  __int16 v62 = objc_alloc_init((Class)NSMutableArray);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v15 = [(NSMutableDictionary *)self->_publicKeyForDevice allValues];
  id v16 = [v15 countByEnumeratingWithState:&v79 objects:v93 count:16];
  if (!v16)
  {
LABEL_13:

    id v14 = v63;
    goto LABEL_50;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v80;
LABEL_7:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v80 != v18) {
      objc_enumerationMutation(v15);
    }
    long long v20 = *(NSObject **)(*((void *)&v79 + 1) + 8 * v19);
    uint64_t v21 = [v20 pushToken];
    unsigned int v22 = [v21 isEqual:v65];

    if (v22) {
      break;
    }
    if (v17 == (id)++v19)
    {
      id v17 = [v15 countByEnumeratingWithState:&v79 objects:v93 count:16];
      if (!v17) {
        goto LABEL_13;
      }
      goto LABEL_7;
    }
  }
  id v23 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v20 pushToken];
    __int16 v25 = [v20 publicKeyData];
    *(_DWORD *)buf = 138412802;
    CFStringRef v84 = v20;
    __int16 v85 = 2112;
    CFStringRef v86 = v24;
    __int16 v87 = 2112;
    id v88 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "_protectedCachedKeyMaterialsForDestination: Found _publicIdentity %@ for pushToken: %@ and publicKey: %@", buf, 0x20u);
  }
  CFStringRef v26 = v20;

  id v14 = v63;
  __int16 v73 = v26;
  if (!v26)
  {
LABEL_50:
    os_unfair_lock_unlock(lock);
    __int16 v73 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      sub_1007157E8();
    }
    long long v54 = 0;
    long long v28 = v62;
    goto LABEL_53;
  }
  CFStringRef v56 = v11;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = [v61 masterKeyMaterials];
  id v27 = [obj countByEnumeratingWithState:&v75 objects:v92 count:16];
  long long v28 = v62;
  if (!v27) {
    goto LABEL_45;
  }
  id v29 = v27;
  uint64_t v30 = *(void *)v76;
  uint64_t v70 = IDSRealTimeEncryptionMKI;
  uint64_t v68 = IDSRealTimeEncryptionMKM;
  uint64_t v69 = IDSRealTimeEncryptionMKS;
  uint64_t v66 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
  uint64_t v67 = IDSRealTimeEncryptionParticipantID;
  uint64_t v71 = *(void *)v76;
  do
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v76 != v30) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v32 = *(NSObject **)(*((void *)&v75 + 1) + 8 * i);
      if (![v14 isEqual:v32])
      {
        id v34 = [v73 wrapMode];
        if (v34 == (id)1)
        {
          uint64_t v35 = 0;
LABEL_29:
          id v36 = [v32 keyMaterial];
          id v37 = [v73 publicIdentity];
          id v74 = 0;
          id v38 = +[GFTKeyWrapping wrapSeed:v36 to:v37 legacy:v35 error:&v74];
          id v33 = v74;

          if (v38) {
            BOOL v39 = v33 == 0;
          }
          else {
            BOOL v39 = 0;
          }
          if (!v39)
          {
            uint64_t v30 = v71;
            goto LABEL_37;
          }
          BOOL v42 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            id v43 = [v73 wrapMode];
            id v44 = [(IDSRealTimeEncryptionIdentity *)v64->_identityForDevice publicIdentity];
            id v45 = [v73 publicIdentity];
            long long v46 = [v32 keyIndex];
            id v47 = [v46 UUIDString];
            *(_DWORD *)buf = 134218754;
            CFStringRef v84 = v43;
            __int16 v85 = 2112;
            CFStringRef v86 = v44;
            __int16 v87 = 2112;
            id v88 = v45;
            long long v28 = v62;
            __int16 v89 = 2112;
            uint64_t v90 = v47;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "_protectedCachedKeyMaterialsForDestination: Encrypted the key material - wrapMode: %llu, local pub key: %@, remote pub key: %@, MKI: %@", buf, 0x2Au);

            id v14 = v63;
          }

          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          long long v48 = [v32 keyIndex];
          long long v49 = IDSGetUUIDDataFromNSUUID();
          [Mutable setObject:v49 forKeyedSubscript:v70];

          id v50 = [v32 keySalt];
          [Mutable setObject:v50 forKeyedSubscript:v69];

          [Mutable setObject:v38 forKeyedSubscript:v68];
          uint64_t v51 = +[NSNumber numberWithUnsignedLongLong:[v32 participantID]];
          [Mutable setObject:v51 forKeyedSubscript:v67];

          long long v52 = +[NSNumber numberWithInteger:[v73 wrapMode]];
          [Mutable setObject:v52 forKeyedSubscript:v66];

          [v28 addObject:Mutable];
          id v33 = 0;
          uint64_t v30 = v71;
        }
        else
        {
          if (!v34)
          {
            uint64_t v35 = 1;
            goto LABEL_29;
          }
          uint64_t v40 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
            sub_100715850((uint64_t)v91, v73);
          }

          id v38 = 0;
          id v33 = 0;
LABEL_37:
          CFMutableDictionaryRef Mutable = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(Mutable, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v84 = v65;
            __int16 v85 = 2112;
            CFStringRef v86 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, Mutable, OS_LOG_TYPE_ERROR, "_protectedCachedKeyMaterialsForDestination: Couldn't protect the key material for pushToken: %@ (error: %@)", buf, 0x16u);
          }
        }

        goto LABEL_43;
      }
      id v33 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v84 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "_protectedCachedKeyMaterialsForDestination: This is the local key material -- ignoring { keyMaterial: %@ }", buf, 0xCu);
      }
LABEL_43:
    }
    id v29 = [obj countByEnumeratingWithState:&v75 objects:v92 count:16];
  }
  while (v29);
LABEL_45:

  os_unfair_lock_unlock(lock);
  unsigned int v53 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v84 = v28;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "_protectedCachedKeyMaterialsForDestination: returning %@", buf, 0xCu);
  }

  id v11 = v56;
  if (a6)
  {
    *a6 = [v61 membershipURIs];
  }
  long long v54 = v28;
LABEL_53:

LABEL_57:

  return v54;
}

- (void)resetMKMLocalSentStatus:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:a3];
  id v4 = [v3 currentLocalMasterKeyMaterial];
  if (v4)
  {
    id v5 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resetMKMLocalSentStatus: reset MKM %@ status", buf, 0xCu);
    }

    [v4 setIsSentToClient:0];
  }
  id v14 = v4;
  uint64_t v15 = v3;
  [v3 cachedMasterKeyMaterialCollection];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v19 = 0u;
  id v6 = [v13 masterKeyMaterials];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v22 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "resetMKMLocalSentStatus: from cache: reset MKM %@ status", buf, 0xCu);
        }

        [v11 setIsSentToClient:0];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [v15 resetClientMasterKeyIdentifierReceipts];
}

- (void)resetSKMLocalSentStatus:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:a3];
  [v3 resetSKMSentToClientStatus];
  id v4 = [v3 currentLocalStableKeyMaterial];
  id v5 = v4;
  if (v4)
  {
    [v4 setIsSentToClient:0];
    id v6 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "resetSKMLocalSentStatus: reset SKM %@ status", buf, 0xCu);
    }
  }
  uint64_t v15 = v5;
  long long v16 = v3;
  [v3 cachedStableKeyMaterialCollection];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v14 = v20 = 0u;
  id v7 = [v14 stableKeyMaterials];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v12 setIsSentToClient:0];
        id v13 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "resetSKMLocalSentStatus: from cache: reset SKM %@ status", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)resetKeyMaterialLocalSentStatus:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(IDSGroupEncryptionController1 *)self resetMKMLocalSentStatus:v5];
  [(IDSGroupEncryptionController1 *)self resetSKMLocalSentStatus:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)destinationsExcludingSelfForDestinations:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  id v6 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v18;
    *(void *)&long long v9 = 138412290;
    long long v16 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (-[IDSGroupEncryptionController1 _isValidPushToken:](self, "_isValidPushToken:", v13, v16, (void)v17)
          && [v13 isEqual:v5])
        {
          id v14 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            unsigned int v22 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: filtering out own push token %@", buf, 0xCu);
          }
        }
        else
        {
          [v6 addObject:v13];
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)_sendKeyMaterialsToGroup:(id)a3 sessionID:(id)a4 toSpecificMembers:(id)a5 shouldIncludeCachedPeerKeyMaterial:(BOOL)a6 requireMKM:(BOOL)a7 requireSKM:(BOOL)a8
{
  BOOL v170 = a8;
  BOOL v8 = a7;
  BOOL v164 = a6;
  id v190 = a3;
  id v172 = a4;
  id v138 = a5;
  [(IDSGroupEncryptionController1 *)self removeExpiredPrekeys];
  v194 = self;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v181 = v8;
  if (v8)
  {
    id v12 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v190];
    v163 = [v12 currentLocalMasterKeyMaterial];
    unsigned int v145 = [v163 keyMaterial];
  }
  else
  {
    unsigned int v145 = 0;
    v163 = 0;
    id v12 = 0;
  }
  if (v170)
  {
    CFStringRef v137 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v190];
    long long v156 = [v137 currentLocalStableKeyMaterial];
    BOOL v136 = [v156 keyMaterial];
  }
  else
  {
    long long v156 = 0;
    BOOL v136 = 0;
    CFStringRef v137 = 0;
  }
  char v133 = v12;
  if (!v8
    || ([v12 currentLocalMasterKeyMaterial],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13)
    && v145)
  {
    int v14 = 0;
  }
  else
  {
    uint64_t v15 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v190;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v145;
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "sendKeyMaterialsToGroup: There is no key material yet for %@. This shouldn't happen... (keyMaterialCache: %@, mkmData: %@)", buf, 0x20u);
    }

    int v14 = 1;
  }
  if (!v170
    || ([v137 currentLocalStableKeyMaterial],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16)
    && v136)
  {
    char v135 = 0;
  }
  else
  {
    v131 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v190;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v137;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v136;
      _os_log_fault_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_FAULT, "sendKeyMaterialsToGroup: There is no stable key material yet for %@. This shouldn't happen... (stableKeyMaterialCache: %@, skmData: %@)", buf, 0x20u);
    }

    if (v14)
    {
      v132 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: both hasValidMKM and hasValidSKM are invalid, return", buf, 2u);
      }

      os_unfair_lock_unlock(lock);
      v130 = v12;
      goto LABEL_149;
    }
    char v135 = 1;
  }
  long long v17 = [(IDSGroupEncryptionController1 *)self destinationsExcludingSelfForDestinations:v138];
  long long v18 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: destinations: %@", buf, 0xCu);
  }

  id v134 = v17;
  id v19 = [v17 count];
  long long v20 = +[IDSFoundationLog RealTimeEncryptionController];
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      participantsForGroup = self->_participantsForGroup;
      if (v181) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      if (v170) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      *(_DWORD *)buf = 138414082;
      *(void *)&uint8_t buf[4] = v190;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v24;
      __int16 v222 = 2112;
      id v223 = v145;
      __int16 v224 = 2112;
      __int16 v225 = v133;
      __int16 v226 = 2112;
      __int16 v227 = v136;
      __int16 v228 = 2112;
      id v229 = v137;
      __int16 v230 = 2112;
      __int16 v231 = participantsForGroup;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: %@, requireMKM: %@, requireSKM: %@, mkmData: %@, keyMaterialCache: %@, skmData: %@, stableKeyMaterialCache: %@, _participantsForGroup: %@", buf, 0x52u);
    }

    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    id obj = v134;
    id v193 = [obj countByEnumeratingWithState:&v211 objects:v240 count:16];
    if (v193)
    {
      uint64_t v192 = *(void *)v212;
      char v140 = v14 | !v181;
      CFStringRef v25 = @"YES";
      if (v181) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      CFStringRef v143 = v26;
      uint64_t v162 = IDSFanoutMessageGroupIDKey;
      if (!v170) {
        CFStringRef v25 = @"NO";
      }
      CFStringRef v142 = v25;
      uint64_t v161 = IDSDSessionMessageSessionID;
      uint64_t v155 = IDSRealTimeEncryptionMKI;
      uint64_t v154 = IDSRealTimeEncryptionMKS;
      uint64_t v153 = IDSRealTimeEncryptionMKM;
      uint64_t v152 = IDSRealTimeEncryptionMKGC;
      uint64_t v159 = IDSRealTimeEncryptionParticipantID;
      uint64_t v160 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
      uint64_t v150 = IDSRealTimeEncryptionSKI;
      uint64_t v151 = IDSDSessionMessageRealTimeEncryptionKeyMaterialKey;
      uint64_t v148 = IDSRealTimeEncryptionSKM;
      uint64_t v149 = IDSRealTimeEncryptionSKS;
      uint64_t v146 = IDSDSessionMessageRealTimeEncryptionStableKeyMaterialKey;
      uint64_t v147 = IDSRealTimeEncryptionSKGC;
      uint64_t v139 = IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey;
      uint64_t v144 = IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsURIsKey;
      do
      {
        id v27 = 0;
        do
        {
          if (*(void *)v212 != v192) {
            objc_enumerationMutation(obj);
          }
          long long v28 = *(void **)(*((void *)&v211 + 1) + 8 * (void)v27);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = 0;
            uint64_t v30 = 0;
            id v31 = 0;
LABEL_103:

            goto LABEL_104;
          }
          long long v209 = 0u;
          long long v210 = 0u;
          long long v207 = 0u;
          long long v208 = 0u;
          unsigned __int8 v32 = [(NSMutableDictionary *)v194->_publicKeyForDevice allValues];
          id v33 = [v32 countByEnumeratingWithState:&v207 objects:v239 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = v27;
            uint64_t v36 = *(void *)v208;
            while (2)
            {
              for (i = 0; i != v34; i = (char *)i + 1)
              {
                if (*(void *)v208 != v36) {
                  objc_enumerationMutation(v32);
                }
                id v38 = *(void **)(*((void *)&v207 + 1) + 8 * i);
                BOOL v39 = [v38 pushToken];
                unsigned int v40 = [v39 isEqual:v28];

                if (v40)
                {
                  unsigned int v41 = +[IDSFoundationLog RealTimeEncryptionController];
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    BOOL v42 = [v38 pushToken];
                    id v43 = [v38 publicKeyData];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v38;
                    *(_WORD *)&unsigned char buf[12] = 2112;
                    *(void *)&buf[14] = v42;
                    *(_WORD *)&buf[22] = 2112;
                    *(void *)&buf[24] = v43;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Found _publicIdentity %@ for pushToken: %@ and publicKey: %@", buf, 0x20u);
                  }
                  id v31 = v38;
                  goto LABEL_53;
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v207 objects:v239 count:16];
              if (v34) {
                continue;
              }
              break;
            }
            id v31 = 0;
LABEL_53:
            id v27 = v35;
          }
          else
          {
            id v31 = 0;
          }

          if ([(IDSGroupEncryptionController1 *)v194 isTestRunning]
            || [(IDSGroupEncryptionController1 *)v194 fakeMKMWrapping])
          {
            *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&buf[16] = v44;
            *(_OWORD *)buf = v44;
            arc4random_buf(buf, 0x20uLL);
            id v29 = +[NSData dataWithBytes:buf length:32];
            id v45 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int16 v235 = 138412546;
              CFStringRef v236 = v29;
              __int16 v237 = 2112;
              id v238 = v31;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: the test is going to use protectedMKMData %@, publicIdentity %@", v235, 0x16u);
            }

            [(IDSGroupEncryptionController1 *)v194 _sendingKeysToMembers:obj];
            uint64_t v30 = 0;
            int v46 = 1;
            int v47 = 1;
            goto LABEL_60;
          }
          if (!v31)
          {
            loga = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v28;
              _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "Couldn't find the publicIdentity for pushToken: %@", buf, 0xCu);
            }
            id v29 = 0;
            uint64_t v30 = 0;
            id v31 = 0;
            goto LABEL_91;
          }
          id v97 = [v31 wrapMode];
          if (v97 == (id)1)
          {
            uint64_t v98 = 0;
          }
          else
          {
            if (v97)
            {
              int v111 = +[IDSFoundationLog RealTimeEncryptionController];
              if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT)) {
                sub_100715850((uint64_t)v234, v31);
              }
              id v29 = 0;
              uint64_t v30 = 0;
              loga = 0;
              id v112 = 0;
              goto LABEL_117;
            }
            uint64_t v98 = 1;
          }
          if (v140)
          {
            id v29 = 0;
            loga = 0;
          }
          else
          {
            CFStringRef v113 = [v163 keyMaterial];
            id v114 = [v31 publicIdentity];
            id v206 = 0;
            id v29 = +[GFTKeyWrapping wrapSeed:v113 to:v114 legacy:v98 error:&v206];
            loga = v206;
          }
          if (!v170 || (v135 & 1) != 0)
          {
            uint64_t v30 = 0;
            id v112 = 0;
            goto LABEL_118;
          }
          int v111 = [v156 keyMaterial];
          id v115 = [v31 publicIdentity];
          id v205 = 0;
          uint64_t v30 = +[GFTKeyWrapping wrapSeed:v111 to:v115 legacy:v98 error:&v205];
          id v112 = v205;
LABEL_117:

LABEL_118:
          if (v181 && (!v29 || loga))
          {
            CFStringRef v116 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = loga;
              _os_log_error_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "Couldn't protect the key material for pushToken: %@ (error: %@)", buf, 0x16u);
            }

            int v46 = 0;
          }
          else
          {
            int v46 = 1;
          }
          if (v170 && (!v30 || v112))
          {
            unsigned int v124 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v112;
              _os_log_error_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "Couldn't protect the stable key material for pushToken: %@ (error: %@)", buf, 0x16u);
            }

            if (!v46)
            {

LABEL_91:
              goto LABEL_103;
            }
            int v47 = 0;
          }
          else
          {
            int v47 = 1;
          }
          CFStringRef v117 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
          {
            id v180 = [v31 wrapMode];
            v176 = [(IDSRealTimeEncryptionIdentity *)v194->_identityForDevice publicIdentity];
            id v174 = [v31 publicIdentity];
            [v163 keyIndex];
            id v187 = v31;
            uint64_t v118 = v178 = v27;
            [v118 UUIDString];
            unsigned int v119 = v185 = v29;
            [v156 keyIndex];
            id v121 = v120 = v30;
            [v121 UUIDString];
            v122 = id v183 = v112;
            id v123 = [v163 participantID];
            *(_DWORD *)buf = 138414338;
            *(void *)&uint8_t buf[4] = v28;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v180;
            *(_WORD *)&buf[22] = 2112;
            *(void *)&buf[24] = v176;
            __int16 v222 = 2112;
            id v223 = v174;
            __int16 v224 = 2112;
            __int16 v225 = v119;
            __int16 v226 = 2112;
            __int16 v227 = v122;
            __int16 v228 = 2048;
            id v229 = v123;
            __int16 v230 = 2112;
            __int16 v231 = (NSMutableDictionary *)v143;
            __int16 v232 = 2112;
            CFStringRef v233 = v142;
            _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: Encrypted key material for pushToken: %@, wrapMode: %llu, local pub key: %@, remote pub key: %@, MKI: %@, SKI: %@, participantID: %llu, requireMKM: %@, requireSKM: %@", buf, 0x5Cu);

            uint64_t v30 = v120;
            id v27 = v178;
            id v31 = v187;

            id v112 = v183;
            id v29 = v185;
          }

LABEL_60:
          if ([(IDSGroupEncryptionController1 *)v194 isTestRunning]) {
            goto LABEL_103;
          }
          v179 = v30;
          unsigned int v184 = v29;
          long long v48 = [v31 fromID];
          long long v49 = sub_1003EA6DC(v48);
          id v50 = +[IDSURI URIWithPrefixedURI:v49];

          v186 = v31;
          uint64_t v51 = [v31 pushToken];
          v175 = v50;
          long long v52 = [v50 URIByAddingPushToken:v51];

          unsigned int v53 = +[NSSet setWithObject:v52];
          v171 = +[IDSDestination destinationWithDestinations:v53];

          os_unfair_lock_unlock(lock);
          id v204 = 0;
          v182 = [(IDSGroupEncryptionController1 *)v194 _protectedCachedKeyMaterialsForDestination:v52 pushToken:v28 forGroup:v190 outURIs:&v204 includePeers:v164];
          id v173 = v204;
          os_unfair_lock_lock(lock);
          v219[0] = v162;
          v219[1] = v161;
          v220[0] = v190;
          v220[1] = v172;
          long long v54 = +[NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:2];
          os_log_t log = (os_log_t)[v54 mutableCopy];

          v177 = v27;
          if ((v46 & v181) == 1)
          {
            v217[0] = v155;
            v165 = [v163 keyIndex];
            int v55 = IDSGetUUIDDataFromNSUUID();
            v218[0] = v55;
            v217[1] = v154;
            CFStringRef v56 = [v163 keySalt];
            v218[1] = v56;
            v218[2] = v184;
            v217[2] = v153;
            v217[3] = v152;
            id v57 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v163 generationCounter]);
            v218[3] = v57;
            v217[4] = v160;
            __int16 v58 = v52;
            id v59 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v186 wrapMode]);
            v218[4] = v59;
            v217[5] = v159;
            int v60 = v47;
            id v61 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v163 participantID]);
            v218[5] = v61;
            __int16 v62 = +[NSDictionary dictionaryWithObjects:v218 forKeys:v217 count:6];
            id v63 = [v62 mutableCopy];
            [log setObject:v63 forKeyedSubscript:v151];

            int v47 = v60;
            long long v52 = v58;

            id v27 = v177;
          }
          int v166 = v47 & v170;
          if ((v47 & v170) == 1)
          {
            v215[0] = v150;
            __int16 v64 = [v156 keyIndex];
            __int16 v65 = IDSGetUUIDDataFromNSUUID();
            v216[0] = v65;
            v215[1] = v149;
            uint64_t v66 = [v156 keySalt];
            v216[1] = v66;
            v216[2] = v179;
            v215[2] = v148;
            v215[3] = v147;
            CFStringRef v157 = v52;
            +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v156 generationCounter]);
            v68 = uint64_t v67 = v27;
            v216[3] = v68;
            v215[4] = v160;
            uint64_t v69 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v186 wrapMode]);
            v216[4] = v69;
            v215[5] = v159;
            uint64_t v70 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v156 participantID]);
            v216[5] = v70;
            uint64_t v71 = +[NSDictionary dictionaryWithObjects:v216 forKeys:v215 count:6];
            id v72 = [v71 mutableCopy];
            [log setObject:v72 forKeyedSubscript:v146];

            long long v52 = v157;
            id v27 = v67;
          }
          id v31 = v186;
          __int16 v73 = v173;
          if (v181)
          {
            if ([v182 count] && v194->_shouldBroadcastAllValidMkMs) {
              [log setObject:v182 forKeyedSubscript:v139];
            }
            if ([v173 count])
            {
              id v74 = [v173 allObjects];
              long long v75 = objc_msgSend(v74, "__imArrayByApplyingBlock:", &stru_100984A20);
              [log setObject:v75 forKeyedSubscript:v144];
            }
          }
          long long v76 = +[IDSDAccountController sharedInstance];
          long long v77 = [(NSMutableDictionary *)v194->_accountIDs objectForKeyedSubscript:v190];
          long long v78 = [v76 accountWithUniqueID:v77];

          if (v78)
          {
            long long v79 = [(IDSGroupEncryptionController1 *)v194 sessionController];
            long long v80 = [v79 sessionWithUniqueID:v172];

            long long v81 = [(IDSGroupEncryptionController1 *)v194 sessionController];
            long long v82 = [v81 sessionWithGroupID:v190];

            if ([v80 destinationsContainFromURI:v52]
              && ([v82 destinationsContainFromURI:v52] & 1) != 0)
            {
              v158 = v78;
              id v83 = im_primary_queue();
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1001AA13C;
              block[3] = &unk_100984A98;
              void block[4] = v194;
              id v84 = v163;
              id v197 = v84;
              id v198 = v80;
              v141 = log;
              v199 = v141;
              id v200 = v171;
              id v201 = v190;
              id v202 = v172;
              v203 = v28;
              dispatch_block_t v85 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
              dispatch_async(v83, v85);

              CFStringRef v86 = v142;
              if (v166)
              {
                __int16 v87 = +[IDSFoundationLog RealTimeEncryptionController];
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                {
                  id v88 = [v156 keyIndex];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v88;
                  *(_WORD *)&unsigned char buf[12] = 2112;
                  *(void *)&buf[14] = v175;
                  _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: Sent SKM: %@ to URI: (%@)", buf, 0x16u);
                }
                CFStringRef v86 = @"YES";
              }
              __int16 v89 = [v84 keyIndex];
              [v89 UUIDString];
              unsigned int v167 = v84;
              uint64_t v90 = v80;
              v92 = id v91 = v52;
              CFTypeRef v93 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"sendKeyMaterialsToGroup: requireMKM: %@, requireSKM: %@, Sent MKI %@ to URI: (%@) (pushToken: %@)(protectedMKM size: %lu)(MKM size: %lu)(message dict: %@)", v143, v86, v92, v175, v28, [v184 length], objc_msgSend(v145, "length"), v141);

              long long v52 = v91;
              long long v80 = v90;

              v195 = v93;
              id v94 = v93;
              cut_dispatch_log_queue();
              int64_t v95 = [v28 rawToken];
              [v167 sentToDevice:v95];

              int v96 = 0;
              id v27 = v177;
              __int16 v73 = v173;
              long long v78 = v158;
            }
            else
            {
              CFStringRef v99 = [(NSMutableDictionary *)v194->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v190];
              id v100 = [v99 mutableCopy];
              id v101 = v100;
              if (v100)
              {
                id v102 = v100;
              }
              else
              {
                id v102 = +[NSMutableArray array];
              }
              v104 = v102;

              if (([v104 containsObject:v28] & 1) == 0)
              {
                [v104 addObject:v28];
                [(NSMutableDictionary *)v194->_participantsWaitingForKeyMaterials setObject:v104 forKeyedSubscript:v190];
              }
              CFStringRef v105 = +[IDSFoundationLog RealTimeEncryptionController];
              id v27 = v177;
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v106 = [v80 destinations];
                [(NSMutableDictionary *)v194->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v190];
                CFStringRef v168 = v82;
                id v107 = v78;
                int v108 = v80;
                BOOL v110 = v109 = v52;
                *(_DWORD *)buf = 138413314;
                *(void *)&uint8_t buf[4] = v175;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v190;
                __int16 v73 = v173;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&buf[24] = v172;
                __int16 v222 = 2112;
                id v223 = v106;
                __int16 v224 = 2112;
                __int16 v225 = v110;
                _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: aborting send of key material message to %@ for group %@ and session %@ since this destination is not in group membership: %@ (pending participants %@)", buf, 0x34u);

                long long v52 = v109;
                long long v80 = v108;
                long long v78 = v107;
                long long v82 = v168;
              }
              int v96 = 3;
            }
          }
          else
          {
            int v103 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              accountIDs = v194->_accountIDs;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v190;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = accountIDs;
              _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "sendKeyMaterialsToGroup: %@ - failed to get the account for this group! (accountsID %@)", buf, 0x16u);
            }

            os_unfair_lock_unlock(lock);
            int v96 = 1;
          }

          if (!v96)
          {
            id v29 = v184;
            uint64_t v30 = v179;
            goto LABEL_103;
          }

          if (v96 != 3)
          {

            goto LABEL_148;
          }
LABEL_104:
          id v27 = (char *)v27 + 1;
        }
        while (v27 != v193);
        id v126 = [obj countByEnumeratingWithState:&v211 objects:v240 count:16];
        id v193 = v126;
      }
      while (v126);
    }

    unsigned int v127 = [(NSMutableDictionary *)v194->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v190];
    [v127 setSentToRemotes:1];
  }
  else
  {
    if (v21)
    {
      CFStringRef v128 = @"NO";
      if (v181) {
        CFStringRef v129 = @"YES";
      }
      else {
        CFStringRef v129 = @"NO";
      }
      if (v170) {
        CFStringRef v128 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v129;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v128;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToGroup: requireMKM: %@, requireSKM: %@ no destination specified, return", buf, 0x16u);
    }

    [(IDSGroupEncryptionController1 *)self sendKeyMaterialsToLocal:v190 sessionID:v172];
  }
  os_unfair_lock_unlock(lock);
LABEL_148:
  v130 = v133;

LABEL_149:
}

- (void)sendKeyMaterialsToLocal:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IDSGroupEncryptionController1 *)self sessionController];
  long long v9 = [v8 sessionWithUniqueID:v7];

  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
    uint64_t v11 = [v10 currentLocalMasterKeyMaterial];

    if (!v11
      || ([v11 keyIndex],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      id v13 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100715978();
      }
      goto LABEL_14;
    }
    if ([v11 isSentToClient])
    {
      id v13 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        long long v16 = v11;
        __int16 v17 = 2112;
        id v18 = v7;
        int v14 = "sendKeyMaterialsToLocal: currentLocalMKM %@ to the session %@, but already sent...";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [v9 recvKeyMaterial:v11];
      [v11 setIsSentToClient:1];
      id v13 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        long long v16 = v11;
        __int16 v17 = 2112;
        id v18 = v7;
        int v14 = "sendKeyMaterialsToLocal: currentLocalMKM %@ to the session %@";
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v11 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100715910();
  }
LABEL_15:
}

- (double)_multiwayFTMessageSendTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [v2 objectForKey:@"ids-multiway-ftmessage-send-timeout"];

  double v4 = 605.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      if (v5 > 0.0)
      {
        double v6 = v5;
        id v7 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          double v10 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a send timeout of %f ", (uint8_t *)&v9, 0xCu);
        }

        double v4 = v6;
      }
    }
  }

  return v4;
}

- (BOOL)_shouldEnforceRemoteTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [v2 objectForKey:@"ids-multiway-ftmessage-enforce-remote-timeout"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v4 = [v3 BOOLValue];
    double v5 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with should enforce remote timeout %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (void)resetDevicePrekey
{
  uint64_t v3 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset the device prekey", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  identityForDevice = self->_identityForDevice;
  self->_identityForDevice = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)activeParticipantsForGroup:(id)a3
{
  if (a3)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    CFStringRef v6 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v5];

    id v7 = [v6 copy];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)removeLocalActiveParticipantForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  [(IDSGroupEncryptionController1 *)self removeActiveParticipant:v5 forGroup:v4];
}

- (void)removeActiveParticipant:(id)a3 forGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 && v7)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    double v10 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v8];
    id v11 = [v10 mutableCopy];

    id v12 = &IDSRegistrationPropertySupportsAVLess_ptr;
    if ([v11 containsObject:v6])
    {
      [v11 removeObject:v6];
      [(NSMutableDictionary *)self->_participantsForGroup setObject:v11 forKeyedSubscript:v8];
      id v13 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v8];
      id v14 = [v13 mutableCopy];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
      id v43 = v11;
      long long v44 = self;
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v50;
LABEL_6:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v49 + 1) + 8 * v19);
          BOOL v21 = [v15 objectForKeyedSubscript:v20];
          if ([v21 containsObject:v6]) {
            break;
          }

          if (v17 == (id)++v19)
          {
            id v17 = [v15 countByEnumeratingWithState:&v49 objects:v60 count:16];
            if (v17) {
              goto LABEL_6;
            }

            id v22 = 0;
            id v23 = 0;
            goto LABEL_16;
          }
        }
        id v23 = v20;
        id v22 = [v21 mutableCopy];
        [v22 removeObject:v6];

        if (v23)
        {
          [v15 setObject:v22 forKeyedSubscript:v23];
          self = v44;
          [(NSMutableDictionary *)v44->_groupIDToTypeToParticipantsPushTokens setObject:v15 forKeyedSubscript:v8];
          goto LABEL_17;
        }
LABEL_16:
        self = v44;
      }
      else
      {

        id v22 = 0;
        id v23 = 0;
      }
LABEL_17:
      [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v8];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = [v24 countByEnumeratingWithState:&v45 objects:v59 count:16];
      id v26 = v24;
      if (v25)
      {
        id v27 = v25;
        id v39 = v22;
        id v40 = v23;
        unsigned int v41 = p_lock;
        BOOL v42 = v8;
        uint64_t v28 = *(void *)v46;
LABEL_19:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void **)(*((void *)&v45 + 1) + 8 * v29);
          id v31 = objc_msgSend(v30, "participantPushToken", v39, v40, v41, v42);
          unsigned __int8 v32 = [v6 rawToken];
          unsigned __int8 v33 = [v31 isEqualToData:v32];

          if (v33) {
            break;
          }
          if (v27 == (id)++v29)
          {
            id v27 = [v24 countByEnumeratingWithState:&v45 objects:v59 count:16];
            if (v27) {
              goto LABEL_19;
            }
            id v26 = v24;
            p_os_unfair_lock_t lock = v41;
            int v8 = v42;
            id v22 = v39;
            id v23 = v40;
            goto LABEL_30;
          }
        }
        id v26 = v30;

        p_os_unfair_lock_t lock = v41;
        int v8 = v42;
        id v22 = v39;
        id v23 = v40;
        if (!v26) {
          goto LABEL_31;
        }
        [v24 removeObject:v26];
        id v34 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v54 = v26;
          __int16 v55 = 2112;
          id v56 = v42;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removed participantInfo: %@ from group: %@}", buf, 0x16u);
        }
      }
LABEL_30:

LABEL_31:
      id v11 = v43;
      self = v44;
      id v12 = &IDSRegistrationPropertySupportsAVLess_ptr;
    }
    uint64_t v35 = [v12[288] RealTimeEncryptionController];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v8];
      *(_DWORD *)buf = 138412802;
      id v54 = v8;
      __int16 v55 = 2112;
      id v56 = v6;
      __int16 v57 = 2112;
      __int16 v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Removed active participant { groupID: %@, activeParticipant: %@, participantsForGroup: %@ }", buf, 0x20u);
    }
    id v37 = [v12[288] RealTimeEncryptionController];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v8];
      *(_DWORD *)buf = 138412546;
      id v54 = v8;
      __int16 v55 = 2112;
      id v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Removed active participant { groupID: %@, participantsInfoForGroup: %@ }", buf, 0x16u);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)resetKeysForGroup:(id)a3 shouldRemoveCurrentParticipants:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_groupIDToKeyMaterialCache)
    {
      if (!+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform]|| v4)
      {
        [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache setObject:0 forKeyedSubscript:v6];
      }
    }
    groupIDToStableKeyMaterialCache = self->_groupIDToStableKeyMaterialCache;
    if (groupIDToStableKeyMaterialCache)
    {
      CFStringRef v9 = [(NSMutableDictionary *)groupIDToStableKeyMaterialCache objectForKeyedSubscript:v6];
      double v10 = v9;
      if (v9)
      {
        id v11 = [v9 currentLocalStableKeyMaterial];
        [v10 setPreviousLocalStableKeyMaterial:v11];

        [v10 setCurrentLocalStableKeyMaterial:0];
        [v10 setSentToRemotes:0];
      }
    }
    [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials setObject:0 forKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials setObject:0 forKeyedSubscript:v6];
    if (v4)
    {
      [(NSMutableDictionary *)self->_participantsForGroup setObject:0 forKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_participantsInfoForGroup setObject:0 forKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens setObject:0 forKeyedSubscript:v6];
    }
    id v12 = +[NSMutableArray array];
    pendingMasterKeyMaterials = self->_pendingMasterKeyMaterials;
    uint64_t v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    BOOL v21 = sub_1001AB2C8;
    id v22 = &unk_100984AC0;
    id v14 = v6;
    id v23 = v14;
    id v15 = v12;
    id v24 = v15;
    [(NSMutableDictionary *)pendingMasterKeyMaterials enumerateKeysAndObjectsUsingBlock:&v19];
    -[NSMutableDictionary removeObjectsForKeys:](self->_pendingMasterKeyMaterials, "removeObjectsForKeys:", v15, v19, v20, v21, v22);
    id v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      groupIDToKeyMaterialCache = self->_groupIDToKeyMaterialCache;
      CFStringRef v18 = @"NO";
      *(_DWORD *)buf = 138412802;
      if (v4) {
        CFStringRef v18 = @"YES";
      }
      id v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = groupIDToKeyMaterialCache;
      __int16 v29 = 2112;
      CFStringRef v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "resetKeysForGroup: %@ keyMaterialCache: %@, shouldRemoveCurrentParticipants: %@", buf, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)unsubscribeEndpointsForGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_membersForGroup setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_membersLightweightStatusDict setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_endpointSubscriptionForGroup setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_participantsForGroup setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_participantsInfoForGroup setObject:0 forKeyedSubscript:v4];
    [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens setObject:0 forKeyedSubscript:v4];
    id v5 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      membersForGroup = self->_membersForGroup;
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      double v10 = membersForGroup;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unsubscribeEndpointsForGroup: %@ updatedMembers: %@", (uint8_t *)&v7, 0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)reportTimeDifferenceBetweenFirstPacketAndMKI:(int64_t)a3 forMKI:(id)a4 service:(id)a5 activeParticipants:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v9 UUIDString];
    int v14 = 134218242;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "reportTimeDifferenceBetweenFirstPacketAndMKI: timeDelta: %lld MKI: %@", (uint8_t *)&v14, 0x16u);
  }
  id v13 = +[IDSAWDLogging sharedInstance];
  [v13 IDSRealTimeEncryptionServiceName:v10 activeParticipants:a6 firstReceivedPacketMKMtimeDelta:a3];
}

- (void)ratchetAndSendKeyMaterialsToAVCForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSGroupEncryptionController1 *)self sessionController];
  uint64_t v9 = [v8 sessionWithUniqueID:v7];

  id v59 = (void *)v9;
  if (v6 && v9)
  {
    os_unfair_lock_lock(&self->_lock);
    id v10 = [(IDSGroupEncryptionController1 *)self groupIDToKeyMaterialCache];
    id v11 = [v10 objectForKeyedSubscript:v6];

    if (v11)
    {
      id v58 = objc_alloc_init((Class)NSMutableArray);
      id v12 = [v11 firstLocalMasterKeyMaterial];
      id v13 = [v11 currentLocalMasterKeyMaterial];
      int v14 = v13;
      if (v13) {
        BOOL v15 = (int)[v13 ratchetIndex] > 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v14) {
        BOOL v17 = 0;
      }
      else {
        BOOL v17 = v15;
      }
      if (((v12 == 0) & ~v15) != 0 || v17)
      {
        id v43 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100715A60(v43, v44, v45, v46, v47, v48, v49, v50);
        }
      }
      else
      {
        __int16 v57 = self;
        unsigned __int8 v18 = [(IDSGroupEncryptionController1 *)self _alreadyLocked_shouldRatchetForGroup:v6];
        uint64_t v19 = +[IDSFoundationLog RealTimeEncryptionController];
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          os_unfair_lock_t lock = &self->_lock;
          if (v20)
          {
            CFStringRef v21 = @"YES";
            *(_DWORD *)buf = 138412802;
            id v67 = v6;
            __int16 v68 = 2112;
            if (v15) {
              CFStringRef v21 = @"NO";
            }
            id v69 = v7;
            __int16 v70 = 2112;
            CFStringRef v71 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ratchetAndSendKeyMaterialsToAVCForGroup for groupID: %@ sessionID: %@ isFirstRatchetForLocal: %@", buf, 0x20u);
          }
          id v55 = v7;

          long long v52 = v14;
          unsigned int v53 = v12;
          if (v15) {
            id v22 = v14;
          }
          else {
            id v22 = v12;
          }
          uint64_t v23 = [(IDSGroupEncryptionController1 *)self deriveKeyMaterial:v22 withInfo:v6];
          [v11 setCurrentLocalMasterKeyMaterial:v23];
          long long v51 = (void *)v23;
          [v58 addObject:v23];
          id v24 = v11;
          id v25 = [v11 remoteMasterKeyMaterialCollectionToSend];
          id v26 = [v25 masterKeyMaterials];

          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id obj = v26;
          id v27 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
          uint64_t v28 = v59;
          if (v27)
          {
            id v29 = v27;
            uint64_t v30 = *(void *)v61;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v61 != v30) {
                  objc_enumerationMutation(obj);
                }
                unsigned __int8 v32 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                unsigned int v33 = [v32 ratchetIndex];
                id v34 = [(IDSGroupEncryptionController1 *)self deriveKeyMaterial:v32 withInfo:v6];
                if (v33)
                {
                  [v58 addObject:v34];
                  -[NSObject updateLastRatchetedKeyMaterial:forRemoteParticipant:](v24, "updateLastRatchetedKeyMaterial:forRemoteParticipant:", v34, [v32 participantID]);
                  id v35 = [v32 participantID];
                  uint64_t v36 = [v34 keyIndex];
                  [v28 reportSendRatchetedMKMToAVCForParticipantID:v35 mki:v36];
                }
                else
                {
                  uint64_t v36 = [(IDSGroupEncryptionController1 *)self deriveKeyMaterial:v34 withInfo:v6];
                  v64[0] = v34;
                  v64[1] = v36;
                  id v37 = +[NSArray arrayWithObjects:v64 count:2];
                  [v58 addObjectsFromArray:v37];

                  -[NSObject updateLastRatchetedKeyMaterial:forRemoteParticipant:](v24, "updateLastRatchetedKeyMaterial:forRemoteParticipant:", v36, [v32 participantID]);
                  id v38 = [v32 participantID];
                  [v34 keyIndex];
                  id v40 = v39 = v6;
                  [v59 reportSendRatchetedMKMToAVCForParticipantID:v38 mki:v40];

                  id v41 = [v32 participantID];
                  BOOL v42 = [v36 keyIndex];
                  [v59 reportSendRatchetedMKMToAVCForParticipantID:v41 mki:v42];

                  id v6 = v39;
                  uint64_t v28 = v59;
                }

                self = v57;
              }
              id v29 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
            }
            while (v29);
          }

          [(IDSGroupEncryptionController1 *)self _alreadyLocked_sendRatchetedKeyMaterials:v58 toAVC:v28];
          os_unfair_lock_unlock(lock);

          id v7 = v55;
          id v11 = v24;
          int v14 = v52;
          id v12 = v53;
          goto LABEL_43;
        }
        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "We are staying put, sending current local key material %@ to AVC...", buf, 0xCu);
        }

        [v59 recvKeyMaterial:v14];
      }
      os_unfair_lock_unlock(&self->_lock);
LABEL_43:

      goto LABEL_44;
    }
    __int16 v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1007159E0();
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v11 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100715AD8();
    }
  }
LABEL_44:
}

- (BOOL)_alreadyLocked_shouldRatchetForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_groupIDToLastMemberAddDate objectForKeyedSubscript:v4];
  id v6 = +[NSDate date];
  id v7 = v6;
  if (v5
    && ([v6 timeIntervalSince1970],
        double v9 = v8,
        [v5 timeIntervalSince1970],
        double v11 = v9 - v10,
        [(IDSGroupEncryptionController1 *)self mkmRatchetMaxWaitWindow],
        v11 < v12))
  {
    id v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSGroupEncryptionController1 *)self mkmRatchetMaxWaitWindow];
      int v18 = 134217984;
      uint64_t v19 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding a member within mkmRatchetMaxWaitWindow: %ld - not advancing ratchet", (uint8_t *)&v18, 0xCu);
    }
    BOOL v15 = 0;
  }
  else
  {
    [(NSMutableDictionary *)self->_groupIDToLastMemberAddDate setObject:v7 forKey:v4];
    id v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [(IDSGroupEncryptionController1 *)self mkmRatchetMaxWaitWindow];
      int v18 = 134217984;
      uint64_t v19 = (uint64_t)v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding a member past mkmRatchetMaxWaitWindow: %ld - we need to ratchet", (uint8_t *)&v18, 0xCu);
    }
    BOOL v15 = 1;
  }

  return v15;
}

- (void)_alreadyLocked_sendRatchetedKeyMaterials:(id)a3 toAVC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 138412546;
    long long v15 = v8;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          double v14 = [v6 uniqueID];
          *(_DWORD *)buf = v15;
          CFStringRef v21 = v12;
          __int16 v22 = 2112;
          uint64_t v23 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending ratcheted key material %@ to AVC for the session %@ - and marking as sent...", buf, 0x16u);
        }
        [v6 recvKeyMaterial:v12];
        [v12 setIsSentToClient:1];
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }
}

- (id)deriveKeyMaterial:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    long long v8 = [v6 keyIndex];
    id v9 = [(IDSGroupEncryptionController1 *)self deriveMKI:v8 withInfo:v7];

    uint64_t v10 = [v6 keyMaterial];
    double v11 = [(IDSGroupEncryptionController1 *)self deriveMKM:v10 withInfo:v7];

    double v12 = [v6 keySalt];
    id v13 = [(IDSGroupEncryptionController1 *)self deriveMKS:v12 withInfo:v7];

    id v14 = objc_alloc((Class)IDSGroupEncryptionKeyMaterial);
    long long v15 = [v6 groupID];
    id v16 = objc_msgSend(v14, "initWithKeyMaterial:keySalt:keyIndex:groupID:participantID:", v11, v13, v9, v15, objc_msgSend(v6, "participantID"));

    if ([v6 isGeneratedLocally]) {
      [v16 setIsGeneratedLocally:1];
    }
    if ([v6 ratchetIndex]) {
      uint64_t v17 = [v6 ratchetIndex] + 1;
    }
    else {
      uint64_t v17 = 1;
    }
    [v16 setRatchetIndex:v17];
    long long v18 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v16;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Generated ratcheted key material: %@ from original: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)deriveMKM:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = [a3 copy];
  id v7 = +[IDSHKDFWrapper deriveKeyMaterialFrom:v6 info:v5];

  return v7;
}

- (id)deriveMKS:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = [a3 copy];
  id v7 = +[IDSHKDFWrapper deriveRandomDataFrom:v6 info:v5];

  return v7;
}

- (id)deriveMKI:(id)a3 withInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableData);
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  [v6 getUUIDBytes:v13];

  [v7 appendBytes:v13 length:16];
  long long v8 = +[IDSHKDFWrapper deriveRandomDataFrom:v7 info:v5];

  id v9 = objc_alloc((Class)NSUUID);
  id v10 = v8;
  id v11 = objc_msgSend(v9, "initWithUUIDBytes:", objc_msgSend(v10, "bytes"));

  return v11;
}

+ (BOOL)isKeyRatchetingEnabledForPlatform
{
  return _os_feature_enabled_impl();
}

- (double)mkmRatchetMaxWaitWindow
{
  v2 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [v2 objectForKey:@"ids-rtencryption-mkm-ratchet-max-wait-window"];

  objc_opt_class();
  double v4 = 5.0;
  if (objc_opt_isKindOfClass()) {
    double v4 = (double)(uint64_t)[v3 integerValue];
  }

  return v4;
}

- (void)_sendMessage:(id)a3 toDestination:(id)a4 forGroup:(id)a5 sessionID:(id)a6 command:(int64_t)a7 timeout:(double)a8 shouldExpire:(BOOL)a9 useQR:(BOOL)a10 completion:(id)a11 completionBlock:(id)a12
{
  BOOL v12 = a9;
  id v56 = a3;
  id v19 = a4;
  id v20 = a5;
  id v55 = a6;
  id v53 = a11;
  id v54 = a12;
  id v21 = +[IDSDAccountController sharedInstance];
  __int16 v22 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v20];
  id v23 = [v21 accountWithUniqueID:v22];

  uint64_t v24 = [(NSMutableDictionary *)self->_fromURIs objectForKeyedSubscript:v20];
  id v25 = (void *)v24;
  if (v23 && v24)
  {
    *(void *)long long v82 = 0;
    *(void *)&v82[8] = v82;
    *(void *)&v82[16] = 0x2020000000;
    LOBYTE(v83) = 0;
    v74[0] = 0;
    v74[1] = v74;
    v74[2] = 0x2020000000;
    char v75 = 0;
    int v26 = IMGetDomainBoolForKey() ^ 1;
    if (a7 != 211) {
      LOBYTE(v26) = 1;
    }
    if (v26)
    {
      id v29 = [(IDSGroupEncryptionController1 *)self sessionController];
      id v27 = [v29 sessionWithUniqueID:v55];

      if (a7 == 211 && a10)
      {
        uint64_t v30 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "sendMessage: calling _generateMKMBlobForQRFromMessage", buf, 2u);
        }

        id v31 = [(IDSGroupEncryptionController1 *)self _generateMKMBlobForQRFromMessage:v56 account:v23 destination:v19 fromURI:v25];
        if (v31)
        {
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_1001ACC7C;
          v67[3] = &unk_100984AE8;
          id v72 = v82;
          __int16 v73 = v74;
          __int16 v68 = v20;
          id v69 = v55;
          id v70 = v53;
          id v71 = v54;
          [v27 sendKeyMaterialMessageDataOverQR:v31 toDestination:v19 completionBlock:v67];

          unsigned __int8 v32 = v68;
        }
        else
        {
          unsigned __int8 v32 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v77 = v27;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to generate a blob to send via QR, only using push {session: %@}", buf, 0xCu);
          }
        }
      }
      long long v52 = +[NSString stringGUID];
      id v33 = objc_alloc_init((Class)IDSSendParameters);
      id v34 = [v25 unprefixedURI];
      [v33 setFromID:v34];

      [v33 setMessage:v56];
      [v33 setEncryptPayload:1];
      [v33 setPriority:300];
      [v33 setDestinations:v19];
      id v35 = +[NSNumber numberWithInteger:a7];
      [v33 setCommand:v35];

      [v33 setIdentifier:v52];
      [v33 setAlwaysSkipSelf:1];
      uint64_t v36 = IDSGetUUIDData();
      [v33 setMessageUUID:v36];

      [v33 setTimeout:a8];
      [v33 setIgnoreMaxRetryCount:1];
      [v33 setWantsResponse:1];
      if (v12) {
        objc_msgSend(v33, "setEnforceRemoteTimeouts:", -[IDSGroupEncryptionController1 _shouldEnforceRemoteTimeout](self, "_shouldEnforceRemoteTimeout"));
      }
      id v37 = [v27 requiredLackOfCapabilities];
      id v38 = [v37 count];

      if (v38)
      {
        id v39 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v27 requiredLackOfCapabilities];
          *(_DWORD *)buf = 138412290;
          long long v77 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Group session encryption message requires lack of properties {requiredLackOfCapabilities: %@}", buf, 0xCu);
        }
        id v41 = [v27 requiredLackOfCapabilities];
        [v33 setRequireLackOfRegistrationProperties:v41];
      }
      BOOL v42 = [v27 requiredCapabilities];
      id v43 = [v42 count];

      if (v43)
      {
        uint64_t v44 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = [v27 requiredCapabilities];
          *(_DWORD *)buf = 138412290;
          long long v77 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Group session encryption message requires properties {requiredCapabilities: %@}", buf, 0xCu);
        }
        uint64_t v46 = [v27 requiredCapabilities];
        [v33 setRequireAllRegistrationProperties:v46];
      }
      uint64_t v47 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        [v33 timeout];
        *(_DWORD *)buf = 138412802;
        long long v77 = v52;
        __int16 v78 = 2048;
        int64_t v79 = a7;
        __int16 v80 = 2048;
        uint64_t v81 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Sending group session encryption message { GUID: %@, command: %ld, timeout: %f }", buf, 0x20u);
      }

      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1001ACDF8;
      v58[3] = &unk_100984B10;
      uint64_t v49 = v52;
      id v59 = v49;
      __int16 v64 = v82;
      __int16 v65 = v74;
      int64_t v66 = a7;
      id v60 = v20;
      id v61 = v55;
      id v62 = v53;
      id v63 = v54;
      [v23 sendMessageWithSendParameters:v33 willSendBlock:0 completionBlock:v58];
      uint64_t v50 = +[NSNumber numberWithInteger:a7];
      long long v51 = +[NSString stringWithFormat:@"sendMessage: Sent messageID %@ to the destination %@ command %@ (message: %@)", v49, v19, v50, v56];

      id v57 = v51;
      cut_dispatch_log_queue();
    }
    else
    {
      id v27 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "sendMessage: do not send MKM over push, return", buf, 2u);
      }
    }

    _Block_object_dispose(v74, 8);
    _Block_object_dispose(v82, 8);
  }
  else
  {
    uint64_t v28 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v82 = 138412802;
      *(void *)&v82[4] = v23;
      *(_WORD *)&v82[12] = 2112;
      *(void *)&v82[14] = v25;
      *(_WORD *)&v82[22] = 2112;
      id v83 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "sendMessage: account: %@ fromID: %@ - failed to get the account forGroup: %@", v82, 0x20u);
    }
  }
}

- (void)sendPublicKeyToGroup:(id)a3 sessionID:(id)a4
{
  membersForGroup = self->_membersForGroup;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)membersForGroup objectForKeyedSubscript:v8];
  id v11 = +[NSSet setWithArray:v9];

  id v10 = +[IDSDestination destinationWithDestinations:v11];
  [(IDSGroupEncryptionController1 *)self sendPublicKeyToDestination:v10 group:v8 sessionID:v7];
  [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v8 sessionID:v7];
}

- (void)sendPublicKeyToDestination:(id)a3 group:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyData];
  BOOL v12 = (void *)v11;
  if (v9)
  {
    if (v11)
    {
      if (v10)
      {
        v34[0] = IDSFanoutMessageGroupIDKey;
        v34[1] = IDSDSessionMessageSessionID;
        v35[0] = v9;
        v35[1] = v10;
        v35[2] = v11;
        v34[2] = IDSDSessionMessageRealTimeEncryptionPublicKey;
        v34[3] = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
        id v13 = +[NSNumber numberWithInteger:[(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyWrappingMode]];
        v35[3] = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

        long long v15 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001AD5A8;
        block[3] = &unk_1009812A0;
        void block[4] = self;
        id v16 = v14;
        uint64_t v24 = v16;
        id v17 = v8;
        id v25 = v17;
        id v18 = v9;
        id v26 = v18;
        id v27 = v10;
        dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
        dispatch_async(v15, v19);

        LODWORD(v19) = self->_isInternal;
        id v20 = +[IDSFoundationLog RealTimeEncryptionController];
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            __int16 v22 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKeyedSubscript:v18];
            *(_DWORD *)buf = 138412802;
            id v29 = v18;
            __int16 v30 = 2112;
            id v31 = v22;
            __int16 v32 = 2112;
            id v33 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendPublicKeyToGroup: %@, ACK'd: %@ (destination: %@)", buf, 0x20u);
          }
        }
        else if (v21)
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v18;
          __int16 v30 = 2112;
          id v31 = v17;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendPublicKeyToGroup: %@ (destination: %@)", buf, 0x16u);
        }
      }
      else
      {
        id v16 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100715C00();
        }
      }
    }
    else
    {
      id v16 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100715B98();
      }
    }
  }
  else
  {
    id v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100715B64();
    }
  }
}

- (void)removeExpiredPrekeys
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_lock);
  publicKeyForDevice = self->_publicKeyForDevice;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001AD6E4;
  v6[3] = &unk_100984B38;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)publicKeyForDevice enumerateKeysAndObjectsUsingBlock:v6];
  [(NSMutableDictionary *)self->_publicKeyForDevice removeObjectsForKeys:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- ($AFFB3261E48324223FE33B3CF9FC7872)participantsReadyForKeyMaterialsForGroup:(SEL)a3
{
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  id v8 = +[NSMutableArray array];
  [(IDSGroupEncryptionController1 *)self removeExpiredPrekeys];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = +[NSMutableSet set];
  uint64_t v11 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v6];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001AD98C;
  v28[3] = &unk_100984B60;
  v28[4] = self;
  id v12 = v10;
  id v29 = v12;
  id v13 = v7;
  id v30 = v13;
  [v11 enumerateObjectsUsingBlock:v28];

  id v14 = +[NSMutableSet set];
  long long v15 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v6];
  BOOL v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_1001ADA0C;
  uint64_t v24 = &unk_100984B60;
  id v25 = self;
  id v16 = v14;
  id v26 = v16;
  id v17 = v8;
  id v27 = v17;
  [v15 enumerateObjectsUsingBlock:&v21];

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v17, "removeObjectsInArray:", v13, v21, v22, v23, v24, v25);
  retstr->var2 = 0;
  retstr->var3 = 0;
  id v18 = v13;
  retstr->var0 = v18;
  id v19 = v17;
  retstr->var1 = v19;
  retstr->var2 = [v12 allObjects];
  retstr->var3 = [v16 allObjects];

  return result;
}

- (void)sendKeyMaterialsToWaitingParticipantsForGroup:(id)a3 sessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v35 = v8;
  long long v36 = v8;
  [(IDSGroupEncryptionController1 *)self participantsReadyForKeyMaterialsForGroup:v6];
  id v9 = (id)v35;
  id v10 = *((id *)&v35 + 1);
  id v11 = [(id)v36 mutableCopy];
  [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials setObject:v11 forKeyedSubscript:v6];

  id v12 = [*((id *)&v36 + 1) mutableCopy];
  [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials setObject:v12 forKeyedSubscript:v6];

  if (v6) {
    BOOL v13 = v7 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v13 || ![v9 count])
  {
    id v19 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v25 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v6];
      *(_DWORD *)buf = 138412802;
      id v38 = v9;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      BOOL v42 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "sendKeyMaterialsToWaitingParticipantsForGroup - didn't send any MKMs to %@ of the group %@ (pending participants %@)", buf, 0x20u);
    }
    if (!v14) {
      goto LABEL_19;
    }
  }
  else
  {
    long long v15 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v6];
      *(_DWORD *)buf = 138412802;
      id v38 = v9;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      BOOL v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToWaitingParticipantsForGroup - Sending the MKMs to %@ of the group %@ (pending participants %@)", buf, 0x20u);
    }
    id v17 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001ADFEC;
    block[3] = &unk_10097E5A8;
    void block[4] = self;
    id v32 = v6;
    id v33 = v7;
    id v34 = v9;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v17, v18);
  }
  if ([v10 count])
  {
    id v20 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v6];
      *(_DWORD *)buf = 138412802;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      BOOL v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialsToWaitingParticipantsForGroup - Sending the SKMs to %@ of the group %@ (pending participants %@)", buf, 0x20u);
    }
    uint64_t v22 = im_primary_queue();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001AE004;
    v27[3] = &unk_10097E5A8;
    v27[4] = self;
    id v28 = v6;
    id v29 = v7;
    id v30 = v10;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v27);
    dispatch_async(v22, v23);

    goto LABEL_22;
  }
LABEL_19:
  uint64_t v24 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v26 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v6];
    *(_DWORD *)buf = 138412802;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    BOOL v42 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "sendKeyMaterialsToWaitingParticipantsForGroup - didn't send any SKMs to %@ of the group %@ (pending participants %@)", buf, 0x20u);
  }
LABEL_22:

  sub_1001ADA8C((uint64_t)&v35);
}

- (void)processedQRMKMPayloadFromData:(id)a3 forGroupID:(id)a4 account:(id)a5 remoteURI:(id)a6 localURI:(id)a7 tokens:(id)a8 completionHandler:(id)a9
{
  id v63 = a3;
  id v60 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v61 = a9;
  dispatch_block_t v18 = +[NSMutableSet set];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v72;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (v24 && ([*(id *)(*((void *)&v71 + 1) + 8 * i) isNull] & 1) == 0)
        {
          id v25 = objc_msgSend(v24, "__imHexString");
          [v18 addObject:v25];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v21);
  }

  id v26 = +[IDSPeerIDManager sharedInstance];
  id v80 = v15;
  id v27 = +[NSArray arrayWithObjects:&v80 count:1];
  id v59 = v14;
  id v28 = [v14 service];
  id v29 = [v28 identifier];
  id v30 = [v26 endpointsForURIs:v27 service:v29 fromURI:v16];

  id v31 = [v30 objectForKey:v15];
  id v57 = v16;
  id v58 = v15;
  id v56 = v30;
  if ([v19 count])
  {
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1001AE618;
    v69[3] = &unk_100984B88;
    id v70 = v18;
    uint64_t v32 = [v31 sortedArrayUsingComparator:v69];

    id v31 = (void *)v32;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v31;
  id v33 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v66;
    while (2)
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v66 != v35) {
          objc_enumerationMutation(obj);
        }
        id v37 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
        id v38 = +[IDSEncryptionController sharedInstance];
        id v64 = 0;
        __int16 v39 = [v38 publicKeyDecryptData:v63 fromEndpoint:v37 pkType:1 priority:300 error:&v64];
        id v40 = v64;

        if (v40)
        {
          __int16 v41 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v76 = v40;
            __int16 v77 = 2112;
            __int16 v78 = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Failed to process QRMKM payload {error: %@, endpoint: %@}", buf, 0x16u);
          }
        }
        else if (v39)
        {
          id v49 = v37;

          uint64_t v50 = JWDecodeDictionary();
          uint64_t v44 = v60;
          long long v51 = [(IDSGroupEncryptionController1 *)self _compactKeyMaterialMessage:v50 isOutgoing:0 groupID:v60];
          long long v52 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v50;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Decoded QR MKM Payload {decodedPayload: %@}", buf, 0xCu);
          }

          id v53 = +[IDSFoundationLog RealTimeEncryptionController];
          uint64_t v46 = v57;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v76 = v51;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Expanded QR MKM Payload {expandedPayload: %@}", buf, 0xCu);
          }

          uint64_t v47 = v61;
          if (v61)
          {
            id v54 = [v49 pushToken];
            (*((void (**)(id, void *, void *))v61 + 2))(v61, v51, v54);

            uint64_t v47 = v61;
          }

          uint64_t v45 = v58;
          id v43 = v59;
          uint64_t v48 = v56;
          goto LABEL_37;
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }

  BOOL v42 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Unable to decrypt the incoming MKM QR blob -- returning nil", buf, 2u);
  }

  id v43 = v59;
  uint64_t v44 = v60;
  uint64_t v46 = v57;
  uint64_t v45 = v58;
  uint64_t v47 = v61;
  uint64_t v48 = v56;
  if (v61) {
    (*((void (**)(id, void, void))v61 + 2))(v61, 0, 0);
  }
  id v49 = 0;
  __int16 v39 = 0;
LABEL_37:
}

- (id)_generateMKMBlobForQRFromMessage:(id)a3 account:(id)a4 destination:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 destinationURIs];
  id v15 = [v14 count];

  if ((unint64_t)v15 < 2)
  {
    dispatch_block_t v18 = [v12 destinationURIs];
    id v16 = [v18 anyObject];

    id v55 = 0;
    id v19 = [v16 _stripPotentialTokenURIWithToken:&v55];
    id v20 = v55;
    if (v20)
    {
      uint64_t v44 = self;
      uint64_t v48 = v16;
      id v49 = v12;
      id v52 = v10;
      id v21 = +[IDSPeerIDManager sharedInstance];
      uint64_t v22 = [v11 service];
      [v22 identifier];
      v24 = dispatch_block_t v23 = v19;
      id v46 = v20;
      id v25 = +[IDSPushToken pushTokenWithData:v20 withServiceLoggingHint:v24];
      id v26 = [v11 service];
      id v27 = [v26 identifier];
      uint64_t v47 = v23;
      id v28 = +[IDSURI URIWithPrefixedURI:v23 withServiceLoggingHint:v27];
      id v51 = v11;
      id v29 = [v11 service];
      id v30 = [v29 identifier];
      id v50 = v13;
      uint64_t v31 = [v21 endpointForPushToken:v25 URI:v28 service:v30 fromURI:v13];

      uint64_t v32 = v31;
      if (v31)
      {
        id v10 = v52;
        id v33 = [(IDSGroupEncryptionController1 *)v44 _compactKeyMaterialMessage:v52 isOutgoing:1 groupID:0];
        uint64_t v34 = JWEncodeDictionary();
        unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v35 = +[IDSEncryptionController sharedInstance];
        id v53 = 0;
        uint64_t v45 = (void *)v34;
        long long v36 = [v35 publicKeyEncryptData:v34 encryptionContext:0 forceSizeOptimizations:0 resetState:0 withEncryptedAttributes:0 toEndpoint:v32 usedEncryptionType:&v54 priority:300 metadata:0 error:&v53];
        id v37 = v53;

        id v43 = v37;
        if (v36)
        {
          unint64_t v38 = v54;
          __int16 v39 = +[IDSFoundationLog RealTimeEncryptionController];
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          id v16 = v48;
          id v12 = v49;
          id v20 = v46;
          if (v38 == 4)
          {
            id v13 = v50;
            if (v40)
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v33;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Encoded QR MKM Payload {compactPayload: %@}", buf, 0xCu);
            }

            id v17 = v36;
          }
          else
          {
            id v13 = v50;
            if (v40)
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v32;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "QR MKM payload used legacy encryption -- returning nil {endpointToTarget: %@}", buf, 0xCu);
            }

            id v17 = 0;
          }
        }
        else
        {
          __int16 v41 = +[IDSFoundationLog RealTimeEncryptionController];
          id v16 = v48;
          id v12 = v49;
          id v20 = v46;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v37;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "QR MKM payload failed to encrypt -- returning nil {error: %@}", buf, 0xCu);
          }

          id v17 = 0;
          id v13 = v50;
        }

        id v19 = v47;
      }
      else
      {
        id v33 = +[IDSFoundationLog RealTimeEncryptionController];
        id v10 = v52;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v20 = v46;
          id v19 = v47;
          id v57 = v47;
          __int16 v58 = 2112;
          id v59 = v46;
          __int16 v60 = 2112;
          id v13 = v50;
          id v61 = v50;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No endpoint found to target, not triggering a query -- returning nil {destinationURIString: %@, tokenFromURL: %@, fromURI: %@}", buf, 0x20u);
          id v17 = 0;
          id v16 = v48;
          id v12 = v49;
        }
        else
        {
          id v17 = 0;
          id v12 = v49;
          id v13 = v50;
          id v19 = v47;
          id v16 = v48;
          id v20 = v46;
        }
      }

      id v11 = v51;
    }
    else
    {
      uint64_t v32 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Unable to generate a QR MKM payload to a non-specific URI -- returning nil {fullDestinationURIString: %@}", buf, 0xCu);
      }
      id v17 = 0;
    }
  }
  else
  {
    id v16 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to generate a QR MKM payload to more than 1 destination -- returning nil {destination: %@}", buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)_compactKeyMaterialMessage:(id)a3 isOutgoing:(BOOL)a4 groupID:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (v6) {
    id v10 = &off_1009D2CB0;
  }
  else {
    id v10 = &off_1009D2CC8;
  }
  if (v6) {
    id v11 = &off_1009D2CC8;
  }
  else {
    id v11 = &off_1009D2CB0;
  }
  id v12 = [v7 mutableCopy];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionKeyAllValidKeyMaterialsURIsKey];
  [v12 removeObjectForKey:IDSFanoutMessageGroupIDKey];
  [v12 removeObjectForKey:IDSDSessionMessageRealTimeEncryptionStableKeyMaterialKey];
  if (v8)
  {
    id v13 = [v11 objectAtIndexedSubscript:0];
    [v12 setObject:v8 forKeyedSubscript:v13];
  }
  id v14 = [v10 objectAtIndexedSubscript:1];
  id v15 = [v12 _arrayForKey:v14];

  if (v15)
  {
    id v16 = [v10 objectAtIndexedSubscript:1];
    [v12 removeObjectForKey:v16];

    id v17 = [v11 objectAtIndexedSubscript:1];
    [v12 setObject:v15 forKeyedSubscript:v17];
  }
  dispatch_block_t v18 = [v10 objectAtIndexedSubscript:2];
  id v19 = [v12 _dictionaryForKey:v18];
  id v20 = [v19 mutableCopy];

  if (v20)
  {
    BOOL v40 = v9;
    id v41 = v8;
    id v21 = [v10 objectAtIndexedSubscript:4];
    uint64_t v22 = [v20 _numberForKey:v21];

    if (v22)
    {
      dispatch_block_t v23 = [v10 objectAtIndexedSubscript:4];
      [v20 removeObjectForKey:v23];

      uint64_t v24 = [v11 objectAtIndexedSubscript:4];
      [v20 setObject:v22 forKeyedSubscript:v24];
    }
    id v25 = [v10 objectAtIndexedSubscript:5];
    id v26 = [v20 _dataForKey:v25];

    if (v26)
    {
      id v27 = [v10 objectAtIndexedSubscript:5];
      [v20 removeObjectForKey:v27];

      id v28 = [v11 objectAtIndexedSubscript:5];
      [v20 setObject:v26 forKeyedSubscript:v28];
    }
    id v42 = v7;
    id v29 = [v10 objectAtIndexedSubscript:6];
    id v30 = [v20 _dataForKey:v29];

    if (v30)
    {
      uint64_t v31 = [v10 objectAtIndexedSubscript:6];
      [v20 removeObjectForKey:v31];

      uint64_t v32 = [v11 objectAtIndexedSubscript:6];
      [v20 setObject:v30 forKeyedSubscript:v32];
    }
    id v33 = [v10 objectAtIndexedSubscript:7];
    uint64_t v34 = [v20 _dataForKey:v33];

    if (v34)
    {
      uint64_t v35 = [v10 objectAtIndexedSubscript:7];
      [v20 removeObjectForKey:v35];

      long long v36 = [v11 objectAtIndexedSubscript:7];
      [v20 setObject:v34 forKeyedSubscript:v36];
    }
    id v37 = [v10 objectAtIndexedSubscript:2];
    [v12 removeObjectForKey:v37];

    unint64_t v38 = [v11 objectAtIndexedSubscript:2];
    [v12 setObject:v20 forKeyedSubscript:v38];

    id v8 = v41;
    id v7 = v42;
    id v9 = v40;
  }

  return v12;
}

- (void)updateServerDesiredKeyMaterialsForGroup:(id)a3 sessionID:(id)a4
{
  BOOL v6 = (IDSRealTimeEncryptionIdentity *)a3;
  dispatch_block_t v85 = a4;
  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v107 = v6;
    __int16 v108 = 2112;
    id v109 = v85;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup groupID:%@ sessionID:%@", buf, 0x16u);
  }

  uint64_t v8 = +[NSMutableSet set];
  id v91 = [(IDSGroupEncryptionController1 *)self _getSetofStandardParticipantsForGroup:v6];
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v6];
  id v10 = [v9 copy];

  id v97 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v11 = [(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyData];
  id v12 = [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:v6];
  id v13 = [v12 currentLocalMasterKeyMaterial];
  __int16 v78 = v12;
  id v14 = [v12 nextLocalMasterKeyMaterial];
  int64_t v79 = [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:v6];
  __int16 v87 = [v79 currentLocalStableKeyMaterial];
  id v84 = +[NSMutableArray array];
  if (v13) {
    [v84 addObject:v13];
  }
  if (v14) {
    [v84 addObject:v14];
  }
  uint64_t v81 = v13;
  long long v82 = (void *)v8;
  id v80 = (void *)v11;
  id v15 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (IDSRealTimeEncryptionIdentity *)[v84 count];
    id v17 = [v10 count];
    *(_DWORD *)buf = 134218240;
    id v107 = v16;
    __int16 v108 = 2048;
    id v109 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup will include %lu mkms for up to %lu participants", buf, 0x16u);
  }

  dispatch_block_t v18 = [(IDSGroupEncryptionController1 *)self sessionController];
  int64_t v95 = [v18 sessionWithUniqueID:v85];

  id v19 = [(IDSGroupEncryptionController1 *)self sessionController];
  p_super = &v6->super;
  CFStringRef v86 = [v19 sessionWithGroupID:v6];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v10;
  id v98 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v98)
  {
    uint64_t v96 = *(void *)v102;
    id v92 = v14;
    uint64_t v90 = self;
    do
    {
      for (i = 0; i != v98; i = (char *)i + 1)
      {
        if (*(void *)v102 != v96) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v22 = [v97 rawToken];
        dispatch_block_t v23 = [v21 participantPushToken];

        if (v22 != v23)
        {
          uint64_t v24 = [v21 participantPushTokenObject];
          unsigned int v25 = [v91 containsObject:v24];

          publicKeyForDevice = self->_publicKeyForDevice;
          id v27 = [v21 participantPushTokenObject];
          id v28 = [(NSMutableDictionary *)publicKeyForDevice objectForKeyedSubscript:v27];

          if (v28)
          {
            id v29 = [v28 fromID];
            id v94 = v29;
          }
          else
          {
            id v29 = [v21 participantURI];
            id v88 = v29;
          }
          id v30 = sub_1003EA6DC(v29);
          uint64_t v31 = +[IDSURI URIWithPrefixedURI:v30];

          if (v28)
          {

            id v13 = [v28 pushToken];
            CFTypeRef v93 = [v13 rawToken];
          }
          else
          {

            id v10 = [v21 participantPushToken];
          }
          uint64_t v32 = [v31 prefixedURI];
          id v33 = (void *)_IDSCopyIDForTokenWithURI();
          uint64_t v34 = +[IDSURI URIWithPrefixedURI:v33];

          uint64_t v35 = v10;
          if (v28)
          {

            uint64_t v35 = v13;
          }

          id v14 = v92;
          if ([v95 destinationsContainFromURI:v34]
            && ([v86 destinationsContainFromURI:v34] & 1) != 0)
          {
            long long v36 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              id v37 = (IDSRealTimeEncryptionIdentity *)[v21 participantIdentifier];
              *(_DWORD *)buf = 134219266;
              CFStringRef v38 = @"YES";
              if (v25) {
                CFStringRef v38 = @"NO";
              }
              id v107 = v37;
              __int16 v108 = 2112;
              id v109 = (id)v38;
              __int16 v110 = 2112;
              int v111 = v28;
              __int16 v112 = 2112;
              CFStringRef v113 = v81;
              __int16 v114 = 2112;
              id v115 = v92;
              __int16 v116 = 2112;
              CFStringRef v117 = v87;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup participantId:%llu lightweight:%@ publicIdentity:%@ keyMaterial:%@ nextKeyMaterial:%@ stableKeyMaterial:%@", buf, 0x3Eu);
            }

            id v39 = [v84 count];
            if (v28) {
              BOOL v40 = v39 == 0;
            }
            else {
              BOOL v40 = 1;
            }
            if (v40) {
              unsigned int v41 = 0;
            }
            else {
              unsigned int v41 = v25;
            }
            if (v41 == 1)
            {
              id v42 = +[IDSFoundationLog RealTimeEncryptionController];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                id v43 = (IDSRealTimeEncryptionIdentity *)[v21 participantIdentifier];
                *(_DWORD *)buf = 134218242;
                id v107 = v43;
                __int16 v108 = 2112;
                id v109 = v81;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup participantId:%llu keyMaterial:%@", buf, 0x16u);
              }

              uint64_t v44 = -[IDSServerDesiredKeyMaterialSet initWithKMs:type:forPublicIdentity:forParticipantID:]([IDSServerDesiredKeyMaterialSet alloc], "initWithKMs:type:forPublicIdentity:forParticipantID:", v84, 13, -[NSObject publicIdentity](v28, "publicIdentity"), [v21 participantIdentifier]);
              [v82 addObject:v44];
            }
            if (v87 && v28)
            {
              uint64_t v45 = +[IDSFoundationLog RealTimeEncryptionController];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                id v46 = (IDSRealTimeEncryptionIdentity *)[v21 participantIdentifier];
                *(_DWORD *)buf = 134218242;
                id v107 = v46;
                __int16 v108 = 2112;
                id v109 = v87;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup participantId:%llu stableKeyMaterial:%@", buf, 0x16u);
              }

              uint64_t v47 = [IDSServerDesiredKeyMaterialSet alloc];
              CFStringRef v105 = v87;
              uint64_t v48 = +[NSArray arrayWithObjects:&v105 count:1];
              id v49 = -[IDSServerDesiredKeyMaterialSet initWithKMs:type:forPublicIdentity:forParticipantID:](v47, "initWithKMs:type:forPublicIdentity:forParticipantID:", v48, 14, -[NSObject publicIdentity](v28, "publicIdentity"), [v21 participantIdentifier]);
              [v82 addObject:v49];

              id v14 = v92;
              goto LABEL_48;
            }
          }
          else
          {
            uint64_t v48 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v50 = [v95 destinations];
              *(_DWORD *)buf = 138413058;
              id v107 = v34;
              __int16 v108 = 2112;
              id v109 = p_super;
              __int16 v110 = 2112;
              int v111 = v85;
              __int16 v112 = 2112;
              CFStringRef v113 = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: aborting send of key material message to %@ for group %@ and session %@ since this destination is not in group membership: %@", buf, 0x2Au);
            }
LABEL_48:
          }
          self = v90;
          goto LABEL_50;
        }
        id v28 = +[IDSFoundationLog RealTimeEncryptionController];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: skip local participant", buf, 2u);
        }
LABEL_50:
      }
      id v98 = [obj countByEnumeratingWithState:&v101 objects:v118 count:16];
    }
    while (v98);
  }

  id v51 = p_super;
  id v52 = v80;
  if (v80)
  {
    id v53 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      identityForDevice = self->_identityForDevice;
      *(_DWORD *)buf = 138412546;
      id v107 = identityForDevice;
      __int16 v108 = 2112;
      id v109 = v80;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup preKey:%@ preKeyData:%@", buf, 0x16u);
    }

    id v55 = [IDSServerDesiredPreKeyMaterialSet alloc];
    int64_t v56 = [(IDSGroupEncryptionController1 *)self realTimeEncryptionPublicKeyWrappingMode];
    id v57 = +[NSDate now];
    __int16 v58 = [(IDSServerDesiredPreKeyMaterialSet *)v55 initWithPublicPreKeyData:v80 wrapMode:v56 creationDate:v57];
    [v82 addObject:v58];
  }
  id v59 = [(IDSGroupEncryptionController1 *)self sessionController];
  __int16 v60 = [v59 sessionWithUniqueID:v85];

  id v61 = +[IDSDAccountController sharedInstance];
  id v62 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:p_super];
  id v63 = [v61 accountWithUniqueID:v62];

  if (v60)
  {
    uint64_t v64 = [(NSMutableDictionary *)self->_fromURIs objectForKeyedSubscript:p_super];
    long long v65 = v64;
    if (v63 && v64)
    {
      long long v66 = [v60 encryptedDataBlob];
      long long v67 = +[IDSFoundationLog RealTimeEncryptionController];
      BOOL v68 = os_log_type_enabled(&v67->super, OS_LOG_TYPE_DEFAULT);
      if (v66)
      {
        if (v68)
        {
          *(_DWORD *)buf = 138412290;
          id v107 = (IDSRealTimeEncryptionIdentity *)v66;
          _os_log_impl((void *)&_mh_execute_header, &v67->super, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: add encryptedDataBlob: %@", buf, 0xCu);
        }

        long long v67 = [[IDSServerDesiredEncryptedDataBlobMaterialSet alloc] initWithEncryptedBlobData:v66 type:12 requireSignature:0];
        [v82 addObject:v67];
      }
      else if (v68)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v67->super, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: haven't got the blob", buf, 2u);
      }

      id v70 = [v60 encryptedMirageHandshakeBlob];
      long long v71 = +[IDSFoundationLog RealTimeEncryptionController];
      BOOL v72 = os_log_type_enabled(&v71->super, OS_LOG_TYPE_DEFAULT);
      if (v70)
      {
        if (v72)
        {
          *(_DWORD *)buf = 138412290;
          id v107 = v70;
          _os_log_impl((void *)&_mh_execute_header, &v71->super, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: add encryptedMirageHandshakeBlob: %@", buf, 0xCu);
        }

        long long v71 = [[IDSServerDesiredEncryptedDataBlobMaterialSet alloc] initWithEncryptedBlobData:v70 type:6 requireSignature:0];
        [v82 addObject:v71];
      }
      else if (v72)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, &v71->super, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: haven't got the handshake blob", buf, 2u);
      }
      id v51 = p_super;

      long long v73 = [v60 getDesiredMaterialSetForEncryptedData];
      long long v74 = +[IDSFoundationLog RealTimeEncryptionController];
      BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
      if (v73)
      {
        if (v75)
        {
          *(_DWORD *)buf = 138412290;
          id v107 = v73;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: add desiredMaterialSetForEncryptedData: %@", buf, 0xCu);
        }

        id v76 = v82;
        [v82 unionSet:v73];
      }
      else
      {
        if (v75)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterialsForGroup: haven't got the desiredMaterialSetForEncryptedData", buf, 2u);
        }

        id v76 = v82;
      }
      id v77 = [v76 copy];
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_1001AFF60;
      v99[3] = &unk_100984BB0;
      id v100 = v63;
      [v60 setServerDesiredKeyMaterials:v77 signer:v99];

      id v69 = v78;
    }
    else
    {
      long long v66 = +[IDSFoundationLog RealTimeEncryptionController];
      id v69 = v78;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v107 = v63;
        __int16 v108 = 2112;
        id v109 = v65;
        __int16 v110 = 2112;
        int v111 = p_super;
        _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "updateServerDesiredKeyMaterialsForGroup: account: %@ fromID: %@ - failed to get the account forGroup: %@", buf, 0x20u);
      }
    }

    id v52 = v80;
  }
  else
  {
    long long v65 = +[IDSFoundationLog RealTimeEncryptionController];
    id v69 = v78;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_100715C68();
    }
  }
}

- (void)rollNewKeysAfterResettingPrekeysForGroups:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rollNewKeysAfterResettingPrekeysForGroups: %@ reason: %ld", buf, 0x16u);
  }

  uint64_t v8 = [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice pushToken];
  id v9 = [v8 copy];

  [(IDSGroupEncryptionController1 *)self resetDevicePrekey];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v13);
        id v15 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001B0230;
        block[3] = &unk_10097E418;
        void block[4] = self;
        void block[5] = v14;
        id v18 = v9;
        dispatch_async(v15, block);

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)didReceiveEndpointsUpdate:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableSet set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)v16) pushTokenObject];
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v14);
  }

  os_unfair_lock_lock(&self->_lock);
  id v18 = [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens objectForKeyedSubscript:v9];
  id v20 = [v18 mutableCopy];
  [v20 intersectsSet:v11];
  +[NSString stringWithFormat:@"newPushTokensForGroup: %@, previousPushTokensForGroup: %@, intersection: %@", v11, v18, v20];
  uint64_t v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  id v37 = sub_1001B0A8C;
  CFStringRef v38 = &unk_10097E4D0;
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v39;
  cut_dispatch_log_queue();

  [(NSMutableDictionary *)self->_lastKnownGroupIDToPushTokens setObject:v11 forKeyedSubscript:v9];
  os_unfair_lock_unlock(&self->_lock);
  if ([v18 isEqualToSet:v11])
  {
    long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v45 = v12;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "didReceiveEndpointsUpdate: %@ forGroup: %@ - nothing changed.(previous %@)", buf, 0x20u);
    }
  }
  else
  {
    endpointUpdateTimer = self->_endpointUpdateTimer;
    if (endpointUpdateTimer)
    {
      [(IMDispatchTimer *)endpointUpdateTimer invalidate];
      uint64_t v24 = self->_endpointUpdateTimer;
      self->_endpointUpdateTimer = 0;

      id v25 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v45 = v12;
        __int16 v46 = 2112;
        id v47 = v9;
        __int16 v48 = 2048;
        uint64_t v49 = 0x4000000000000000;
        __int16 v50 = 2112;
        id v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "didReceiveEndpointsUpdate: %@ forGroup: %@ - invalidated the previous key rolling timer. Wait %f seconds more again to get more endpoint updates... (previous %@)", buf, 0x2Au);
      }
    }
    id v26 = objc_alloc((Class)IMDispatchTimer);
    int64_t v27 = im_primary_queue();
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001B0B60;
    v30[3] = &unk_100984BD8;
    uint64_t v31 = v12;
    id v32 = v9;
    id v33 = v18;
    uint64_t v34 = self;
    id v28 = (IMDispatchTimer *)[v26 initWithQueue:v27 interval:2 repeats:0 handlerBlock:v30];
    id v29 = self->_endpointUpdateTimer;
    self->_endpointUpdateTimer = v28;

    long long v22 = v31;
  }
}

- (BOOL)_isMemberStandard:(id)a3 lightweightStatusDict:(id)a4
{
  double v4 = [a4 objectForKeyedSubscript:a3];
  unsigned __int8 v5 = [v4 isEqualToNumber:&off_1009D17A0];

  return v5;
}

- (BOOL)_isMemberLightweight:(id)a3 lightweightStatusDict:(id)a4
{
  return ![(IDSGroupEncryptionController1 *)self _isMemberStandard:a3 lightweightStatusDict:a4];
}

- (void)updateLightweightMemberTypes:(id)a3 members:(id)a4 triggeredLocally:(BOOL)a5 forGroup:(id)a6 sessionID:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  os_unfair_lock_lock(&self->_lock);
  id v16 = +[NSMutableArray array];
  id v17 = [(NSMutableDictionary *)self->_membersLightweightStatusDict objectForKeyedSubscript:v14];
  id v18 = [v17 copy];
  long long v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = +[NSDictionary dictionary];
  }
  long long v43 = v20;

  id v21 = [v12 copy];
  [(NSMutableDictionary *)self->_membersLightweightStatusDict setObject:v21 forKeyedSubscript:v14];

  long long v22 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_block_t v23 = [(NSMutableDictionary *)self->_membersLightweightStatusDict objectForKeyedSubscript:v14];
    *(_DWORD *)buf = 138412546;
    id v50 = v23;
    __int16 v51 = 2112;
    id v52 = v14;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: membersLightweightStatusDict: %@ for group: %@", buf, 0x16u);
  }
  if (!a5)
  {
    long long v42 = v16;
    id v39 = v15;
    [(NSMutableDictionary *)self->_membersForGroup setObject:v13 forKeyedSubscript:v14];
    uint64_t v24 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(NSMutableDictionary *)self->_membersForGroup objectForKeyedSubscript:v14];
      *(_DWORD *)buf = 138412546;
      id v50 = v25;
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: membersForGroup: %@ for group: %@", buf, 0x16u);
    }
    id v40 = v14;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v41 = v13;
    id v26 = v13;
    id v27 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([(IDSGroupEncryptionController1 *)self _isMemberLightweight:v31 lightweightStatusDict:v12])
          {
            id v32 = +[IDSFoundationLog RealTimeEncryptionController];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v31;
              id v33 = v32;
              uint64_t v34 = "updateLightweightMemberTypes: member %@ is lightweight; should not get MKMs";
              goto LABEL_20;
            }
            goto LABEL_21;
          }
          unsigned int v35 = [(IDSGroupEncryptionController1 *)self _isMemberStandard:v31 lightweightStatusDict:v43];
          id v32 = +[IDSFoundationLog RealTimeEncryptionController];
          BOOL v36 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v36)
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v31;
              id v33 = v32;
              uint64_t v34 = "updateLightweightMemberTypes: member %@ was already a standard member";
LABEL_20:
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
            }
LABEL_21:

            continue;
          }
          if (v36)
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: member %@ is now standard and wasn't before; should get MKMs",
              buf,
              0xCu);
          }

          [v42 addObject:v31];
        }
        id v28 = [v26 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v28);
    }

    id v14 = v40;
    id v13 = v41;
    id v15 = v39;
    id v16 = v42;
  }
  os_unfair_lock_unlock(&self->_lock);
  if ([v16 count])
  {
    id v37 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = [v16 count];
      *(_DWORD *)buf = 134218242;
      id v50 = v38;
      __int16 v51 = 2112;
      id v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "updateLightweightMemberTypes: have %lu new standard members: %@", buf, 0x16u);
    }

    [(IDSGroupEncryptionController1 *)self requestKeyMaterialForGroup:v14 sessionID:v15 toSpecificMembers:v16 requireMKM:1 requireSKM:1];
  }
  [(IDSGroupEncryptionController1 *)self _updateRelevantEncryptedDataBlobForSession:v15];
  [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v14 sessionID:v15];
}

- (void)setMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6
{
  id v10 = (IDSEndpointSubscription *)a3;
  id v11 = (IDSEndpointSubscription *)a4;
  id v35 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = [(IDSEndpointSubscription *)v10 copy];
  [(NSMutableDictionary *)self->_membersForGroup setObject:v13 forKeyedSubscript:v11];

  uint64_t v34 = v12;
  id v14 = [v12 copy];
  [(NSMutableDictionary *)self->_membersLightweightStatusDict setObject:v14 forKeyedSubscript:v11];

  id v15 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    long long v47 = v10;
    __int16 v48 = 2112;
    uint64_t v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "setMembers: %@ forGroup: %@", buf, 0x16u);
  }

  id v16 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v17 = v10;
  id v18 = [(IDSEndpointSubscription *)v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        [v16 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      id v19 = [(IDSEndpointSubscription *)v17 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v19);
  }

  long long v22 = +[IDSDAccountController sharedInstance];
  dispatch_block_t v23 = [(NSMutableDictionary *)self->_accountIDs objectForKeyedSubscript:v11];
  uint64_t v24 = [v22 accountWithUniqueID:v23];

  id v25 = [(NSMutableDictionary *)self->_fromURIs objectForKeyedSubscript:v11];
  id v26 = [IDSEndpointSubscription alloc];
  id v27 = [v24 service];
  id v28 = [v27 identifier];
  uint64_t v29 = [(IDSEndpointSubscription *)v26 initWithServiceIdentifier:v28 localURI:v25 subscribedURIs:v16 queue:self->_realtimeEncryptionQueue];

  [(NSMutableDictionary *)self->_endpointSubscriptionForGroup setObject:v29 forKeyedSubscript:v11];
  id v30 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v47 = v29;
    __int16 v48 = 2112;
    uint64_t v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "setMembers: endpointSubscription %p forGroup: %@", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    uint64_t v31 = [(NSMutableDictionary *)self->_prekeyAckCountForGroup objectForKey:v11];

    if (!v31)
    {
      [(NSMutableDictionary *)self->_prekeyAckCountForGroup setObject:&off_1009D17A0 forKeyedSubscript:v11];
      id v32 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v47 = v11;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "ACK'd prekey count is reset to 0 forGroup: %@", buf, 0xCu);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (![(IDSGroupEncryptionController1 *)self isTestRunning])
  {
    realtimeEncryptionQueue = self->_realtimeEncryptionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B161C;
    block[3] = &unk_10097E5A8;
    id v37 = v29;
    id v38 = v11;
    id v39 = self;
    id v40 = v35;
    dispatch_async(realtimeEncryptionQueue, block);
  }
}

- (void)didUpdateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 lightweightStatusDict:(id)a6 hasChangedStandardMembers:(BOOL)a7 newlyAddedMembers:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a6;
  id v18 = [a3 copy];
  id v19 = [v18 sortedArrayUsingSelector:"compare:"];

  id v20 = [v17 copy];
  [(NSMutableDictionary *)self->_membersForGroup setObject:v19 forKeyedSubscript:v14];
  [(NSMutableDictionary *)self->_membersLightweightStatusDict setObject:v20 forKeyedSubscript:v14];
  id v21 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    long long v22 = [(NSMutableDictionary *)self->_membersForGroup objectForKeyedSubscript:v14];
    CFStringRef v23 = @"NO";
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v22;
    __int16 v32 = 2112;
    if (v9) {
      CFStringRef v23 = @"YES";
    }
    CFStringRef v33 = v23;
    __int16 v34 = 2112;
    id v35 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "didUpdateMembers to %@, hasChangedStandardMembers: %@, newlyAddedMembers: %@", buf, 0x20u);
  }
  uint64_t v24 = +[IDSDestination destinationWithDestinations:v16];
  if (v24 && [v16 count]) {
    [(IDSGroupEncryptionController1 *)self sendPublicKeyToDestination:v24 group:v14 sessionID:v15];
  }
  if (v9)
  {
    id v25 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "didUpdateMembers: standard members changed", buf, 2u);
    }

    if (+[IDSGroupEncryptionController1 isKeyRatchetingEnabledForPlatform])
    {
      id v26 = +[IDSFoundationLog RealTimeEncryptionController];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "GFTKeyRatcheting is enabled - we will be ratcheting on member add", buf, 2u);
      }

      [(IDSGroupEncryptionController1 *)self ratchetAndSendKeyMaterialsToAVCForGroup:v14 sessionID:v15];
    }
    [(IDSGroupEncryptionController1 *)self requestKeyMaterialForGroup:v14 sessionID:v15];
    [(IDSGroupEncryptionController1 *)self _updateRelevantEncryptedDataBlobForSession:v15];
  }
  else if ([v16 count])
  {
    id v27 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "didUpdateMembers: no standard members changed, but still have newly added. Sending to newly added.", buf, 2u);
    }

    id v28 = [v16 allObjects];
    BYTE2(v29) = 0;
    LOWORD(v29) = 257;
    -[IDSGroupEncryptionController1 _requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:](self, "_requestKeyMaterialForGroup:sessionID:toSpecificMembers:shouldTrackDistribution:shouldIncludeCachedPeerKeyMaterial:shouldGenerateMKM:requireMKM:requireSKM:isFirstSession:", v14, v15, v28, 0, 0, 0, v29);
  }
  [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v14 sessionID:v15];
}

- (void)_updateRelevantEncryptedDataBlobForSession:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(IDSGroupEncryptionController1 *)self sessionController];
  id v6 = [v5 sessionWithUniqueID:v4];

  if (v6)
  {
    [v6 updateRelevantEncryptedDataBlob];
  }
  else
  {
    id v7 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100715D40();
    }
  }
}

- (BOOL)_isValidPushToken:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)allParticipantsInfoForGroup:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:a3];
  id v4 = [v3 allValues];
  id v5 = [v4 copy];

  return v5;
}

- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6 waitingParticipantsTokens:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([a4 count]) {
    double preKeyRequestDelayDuration = self->_preKeyRequestDelayDuration;
  }
  else {
    double preKeyRequestDelayDuration = 0.01;
  }
  dispatch_time_t v17 = dispatch_walltime(0, (uint64_t)(preKeyRequestDelayDuration * 1000000000.0));
  id v18 = im_primary_queue();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001B2060;
  v23[3] = &unk_100984C50;
  v23[4] = self;
  id v24 = v12;
  double v28 = preKeyRequestDelayDuration;
  id v25 = v15;
  id v26 = v13;
  id v27 = v14;
  id v19 = v14;
  id v20 = v13;
  id v21 = v15;
  id v22 = v12;
  dispatch_after(v17, v18, v23);
}

- (void)_updateAllActiveParticipantsInfoFromParticipants:(id)a3 standardParticipantsPushTokens:(id)a4 lightweightParticipantsPushTokens:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v14 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v13];

  if (!v14)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens setObject:Mutable forKeyedSubscript:v13];
  }
  id v16 = [v11 mutableCopy];
  dispatch_time_t v17 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v13];
  [v17 setObject:v16 forKeyedSubscript:&off_1009D1770];

  id v18 = [v12 mutableCopy];
  id v19 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v13];
  [v19 setObject:v18 forKeyedSubscript:&off_1009D1788];

  id v20 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v13];
    id v22 = [v21 objectForKeyedSubscript:&off_1009D1770];
    *(_DWORD *)buf = 138412290;
    id v52 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "current standard participants: %@", buf, 0xCu);
  }
  long long v45 = v12;

  CFStringRef v23 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_100715DA8();
  }
  id v24 = v11;

  id v25 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v13];
    id v27 = [v26 objectForKeyedSubscript:&off_1009D1788];
    *(_DWORD *)buf = 138412290;
    id v52 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "current lightweight participants: %@", buf, 0xCu);
  }
  long long v44 = v13;

  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v29 = objc_alloc_init((Class)NSMutableArray);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v30 = v10;
  id v31 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        BOOL v36 = [v35 participantPushTokenObject];
        if ([(IDSGroupEncryptionController1 *)self _isValidPushToken:v36]
          && ([v28 containsObject:v35] & 1) == 0)
        {
          if ([v24 containsObject:v36])
          {
            [v28 addObject:v35];
            [v29 addObject:v36];
          }
          if ([v45 containsObject:v36])
          {
            [v28 addObject:v35];
            [v29 addObject:v36];
          }
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v32);
  }

  id v37 = [v28 mutableCopy];
  [(NSMutableDictionary *)self->_participantsInfoForGroup setObject:v37 forKeyedSubscript:v44];

  id v38 = [v29 mutableCopy];
  [(NSMutableDictionary *)self->_participantsForGroup setObject:v38 forKeyedSubscript:v44];

  id v39 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v44];
    *(_DWORD *)buf = 138412290;
    id v52 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "_participantsInfoForGroup[groupID]: %@", buf, 0xCu);
  }
  long long v41 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    long long v42 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v44];
    *(_DWORD *)buf = 138412290;
    id v52 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "_participantsForGroup[groupID]: %@", buf, 0xCu);
  }
  os_unfair_lock_unlock(lock);
}

- (id)_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:(id)a3 waitingParticipants:(id)a4 addedParticipantsDiff:(id)a5 currentParticipantsPushTokens:(id)a6 participantType:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v50 = a6;
  id v49 = objc_alloc_init((Class)NSMutableArray);
  id v15 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  if (!v13) {
    id v13 = objc_alloc_init((Class)NSMutableArray);
  }
  id v16 = objc_alloc_init((Class)NSMutableArray);
  if ([v13 count])
  {
    uint64_t v17 = +[NSMutableArray arrayWithArray:v13];

    id v16 = (id)v17;
  }
  if ([v14 count])
  {
    [v16 addObjectsFromArray:v14];
  }
  else
  {
    id v18 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v57 = [v14 count];
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "addedParticipantsDiff count = %lu, no need to be added to participantsNeedsKeyMaterial", buf, 0xCu);
    }
  }
  if (![v16 count])
  {
    id v32 = v13;
    goto LABEL_52;
  }
  id v46 = v12;
  int64_t v47 = a7;
  id v45 = v14;
  id v19 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v16;
    __int16 v58 = 2112;
    id v59 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "before processing participantsNeedsKeyMaterial: %@, local: %@", buf, 0x16u);
  }

  long long v48 = +[NSMutableArray array];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v20 = v16;
  id v21 = [v20 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v52;
    do
    {
      id v24 = 0;
      do
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v24);
        if (![(IDSGroupEncryptionController1 *)self _isValidPushToken:v25])
        {
          id v26 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v25;
            id v27 = v26;
            id v28 = "invalid participant push token %@, continue";
            goto LABEL_29;
          }
LABEL_30:

          goto LABEL_31;
        }
        if ([v25 isEqual:v15])
        {
          id v26 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v25;
            id v27 = v26;
            id v28 = "%@ is mine! don't need to add";
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        if (([v50 containsObject:v25] & 1) == 0)
        {
          id v26 = +[IDSFoundationLog RealTimeEncryptionController];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v25;
            id v27 = v26;
            id v28 = "waiting praticipant %@ no longer exists! don't need to add";
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
          }
          goto LABEL_30;
        }
        id v29 = [(NSMutableDictionary *)self->_publicKeyForDevice objectForKeyedSubscript:v25];
        if (v29)
        {
        }
        else if (([v48 containsObject:v25] & 1) == 0)
        {
          id v30 = v48;
          goto LABEL_35;
        }
        id v30 = v49;
LABEL_35:
        [v30 addObject:v25];
LABEL_31:
        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v31 = [v20 countByEnumeratingWithState:&v51 objects:v55 count:16];
      id v22 = v31;
    }
    while (v31);
  }

  if (v47 == 1)
  {
    id v12 = v46;
    if (!self->_participantsWaitingForStableKeyMaterials)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      participantsWaitingForStableKeyMaterials = self->_participantsWaitingForStableKeyMaterials;
      self->_participantsWaitingForStableKeyMaterials = Mutable;
    }
    id v32 = v48;
    id v38 = [v48 copy];
    [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials setObject:v38 forKeyedSubscript:v46];

    id v35 = +[IDSFoundationLog RealTimeEncryptionController];
    id v14 = v45;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 138412290;
    id v57 = v48;
    id v39 = "waitingParticipants: %@";
    goto LABEL_50;
  }
  id v12 = v46;
  if (!v47)
  {
    id v14 = v45;
    id v32 = v48;
    if (!self->_participantsWaitingForKeyMaterials)
    {
      uint64_t v33 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      participantsWaitingForKeyMaterials = self->_participantsWaitingForKeyMaterials;
      self->_participantsWaitingForKeyMaterials = v33;
    }
    id v35 = [v48 copy];
    [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials setObject:v35 forKeyedSubscript:v46];
    goto LABEL_51;
  }
  id v35 = +[IDSFoundationLog RealTimeEncryptionController];
  id v14 = v45;
  id v32 = v48;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v57 = (id)v47;
    id v39 = "_getAndUpdateParticipantsWaitingForKeyMaterialsForGroup: unknown participantType: %ld";
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
  }
LABEL_51:

LABEL_52:
  id v40 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v57 = v49;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "newParticipantsReadyForKeys: %@", buf, 0xCu);
  }

  long long v41 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    long long v42 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v12];
    *(_DWORD *)buf = 138412290;
    id v57 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "_participantsWaitingForStableKeyMaterials: %@", buf, 0xCu);
  }
  id v43 = [v49 copy];

  return v43;
}

- (void)_dispatchDeferredPrekeyRequestForGroupID:(id)a3 previousParticipantsPushTokens:(id)a4 currentActiveParticipants:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v24 = a4;
  id v11 = a5;
  id v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v13 = +[NSSet set];
  id v14 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v10];
  id v15 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v10];
  if (v14)
  {
    uint64_t v16 = [v13 setByAddingObjectsFromArray:v14];

    id v13 = (void *)v16;
  }
  if (v15)
  {
    uint64_t v17 = [v13 setByAddingObjectsFromArray:v15];

    id v13 = (void *)v17;
  }
  if ([v13 count]
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_groupIDToIsDeferredPreKeyRequestPending, "objectForKeyedSubscript:", v10), id v18 = objc_claimAutoreleasedReturnValue(), v19 = [v18 BOOLValue], v18, (v19 & 1) == 0))
  {
    [(NSMutableDictionary *)self->_groupIDToIsDeferredPreKeyRequestPending setObject:&__kCFBooleanTrue forKeyedSubscript:v10];
    os_unfair_lock_unlock(&self->_lock);
    id v21 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "_dispatchDeferredPrekeyRequestForGroupID - participants have been updated but we are not yet able to send key material to participants %@", buf, 0xCu);
    }

    id v22 = [v13 allObjects];
    uint64_t v23 = self;
    id v20 = v24;
    [(IDSGroupEncryptionController1 *)v23 _dispatchDeferredPrekeyRequestForGroupID:v10 previousParticipantsPushTokens:v24 currentActiveParticipants:v11 sessionID:v12 waitingParticipantsTokens:v22];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v20 = v24;
  }
}

- (void)_updateLightweightParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v56 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v9];
  id v11 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->_participantsInfoForGroup setObject:v12 forKeyedSubscript:v9];
  }
  id v13 = +[NSMutableArray array];
  id v14 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v9];
  id v15 = [v14 mutableCopy];

  uint64_t v16 = [v10 objectForKeyedSubscript:&off_1009D1770];
  id v55 = v10;
  [v10 objectForKeyedSubscript:&off_1009D1788];
  v62 = os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_unlock(&self->_lock);
  +[NSMutableArray array];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1001B391C;
  v91[3] = &unk_100984C78;
  v91[4] = self;
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  id v92 = v59;
  id v63 = v13;
  id v93 = v63;
  id v17 = v16;
  id v94 = v17;
  id v57 = v8;
  [v8 enumerateObjectsUsingBlock:v91];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v87 objects:v102 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v88;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v88 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        id v24 = [v23 participantPushTokenObject];
        unsigned int v25 = [v17 containsObject:v24];

        if (v25) {
          [v63 addObject:v23];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v87 objects:v102 count:16];
    }
    while (v20);
  }

  id v26 = [v17 copy];
  id v27 = v59;
  id v28 = [v59 copy];
  [(IDSGroupEncryptionController1 *)self _updateAllActiveParticipantsInfoFromParticipants:v63 standardParticipantsPushTokens:v26 lightweightParticipantsPushTokens:v28 groupID:v9];

  id v29 = [v59 mutableCopy];
  id v30 = [v62 mutableCopy];
  os_unfair_lock_lock(lock);
  [v29 removeObjectsInArray:v62];
  [v30 removeObjectsInArray:v59];
  +[NSString stringWithFormat:@"_updateLightweightParticipants: groupID: %@, previous %@, new %@", v9, v62, v59];
  long long v82 = _NSConcreteStackBlock;
  uint64_t v83 = 3221225472;
  id v84 = sub_1001B3A54;
  dispatch_block_t v85 = &unk_10097E4D0;
  id v86 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v86;
  cut_dispatch_log_queue();
  long long v54 = v30;
  id v32 = +[NSString stringWithFormat:@"_updateLightweightParticipants: groupID: %@, added diff %@, removed diff %@", v9, v29, v30];

  id v77 = _NSConcreteStackBlock;
  uint64_t v78 = 3221225472;
  int64_t v79 = sub_1001B3B28;
  id v80 = &unk_10097E4D0;
  id v53 = v32;
  id v81 = v53;
  cut_dispatch_log_queue();
  __int16 v58 = v29;
  if ([v29 count])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v33 = v29;
    id v34 = [v33 countByEnumeratingWithState:&v73 objects:v101 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v74;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v74 != v36) {
            objc_enumerationMutation(v33);
          }
          [(IDSGroupEncryptionController1 *)self _noteKeyMaterialNotNeededForDestination:*(void *)(*((void *)&v73 + 1) + 8 * (void)j) groupID:v9];
        }
        id v35 = [v33 countByEnumeratingWithState:&v73 objects:v101 count:16];
      }
      while (v35);
    }

    id v29 = v58;
  }
  id v38 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v9];
  id v39 = [v38 mutableCopy];

  long long v52 = v39;
  id v40 = [(IDSGroupEncryptionController1 *)self _getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:v9 waitingParticipants:v39 addedParticipantsDiff:v29 currentParticipantsPushTokens:v59 participantType:1];
  os_unfair_lock_unlock(lock);
  if ([v40 count])
  {
    long long v41 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v9];
    long long v42 = +[NSString stringWithFormat:@"_updateLightweightParticipants - Sending the stable key material to %@ of the group %@ (pending participants %@)", v40, v9, v41];

    BOOL v68 = _NSConcreteStackBlock;
    uint64_t v69 = 3221225472;
    id v70 = sub_1001B3BFC;
    long long v71 = &unk_10097E4D0;
    id v72 = v42;
    os_unfair_lock_t locka = v42;
    cut_dispatch_log_queue();
    id v43 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B3CD0;
    block[3] = &unk_10097E5A8;
    void block[4] = self;
    id v44 = v9;
    id v65 = v44;
    id v45 = v56;
    id v46 = v56;
    id v66 = v46;
    id v67 = v40;
    dispatch_block_t v47 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v43, v47);

    long long v48 = locka;
    [(IDSGroupEncryptionController1 *)self requestPendingKeyMaterialsForGroup:v44 sessionID:v46];
    id v49 = v44;
    id v27 = v59;
    [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v49 sessionID:v46];

    id v50 = v57;
  }
  else
  {
    long long v48 = +[IDSFoundationLog RealTimeEncryptionController];
    id v45 = v56;
    id v50 = v57;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      long long v51 = [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:v9];
      *(_DWORD *)buf = 138412802;
      uint64_t v96 = v40;
      __int16 v97 = 2112;
      id v98 = v9;
      __int16 v99 = 2112;
      id v100 = v51;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "_updateLightweightParticipants - didn't send any stable key materials to %@ of the group %@ (pending participants %@)", buf, 0x20u);
    }
  }

  [(IDSGroupEncryptionController1 *)self _dispatchDeferredPrekeyRequestForGroupID:v9 previousParticipantsPushTokens:v62 currentActiveParticipants:v50 sessionID:v45];
}

- (void)_updateStandardParticipants:(id)a3 forGroup:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v63 = a5;
  os_unfair_lock_lock(&self->_lock);
  id v10 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:v9];
  id v11 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->_participantsInfoForGroup setObject:v12 forKeyedSubscript:v9];
  }
  id v13 = +[NSMutableArray array];
  id v14 = [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:v9];
  id v15 = [v14 mutableCopy];

  id v65 = [v10 objectForKeyedSubscript:&off_1009D1770];
  id v62 = v10;
  uint64_t v16 = [v10 objectForKeyedSubscript:&off_1009D1788];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_unlock(&self->_lock);
  +[NSMutableArray array];
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_1001B4508;
  v99[3] = &unk_100984C78;
  void v99[4] = self;
  id v69 = (id)objc_claimAutoreleasedReturnValue();
  id v100 = v69;
  id v70 = v13;
  id v101 = v70;
  id v17 = v16;
  id v102 = v17;
  id v66 = v8;
  [v8 enumerateObjectsUsingBlock:v99];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v95 objects:v110 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v96;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v96 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        id v24 = [v23 participantPushTokenObject];
        unsigned int v25 = [v17 containsObject:v24];

        if (v25) {
          [v70 addObject:v23];
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v95 objects:v110 count:16];
    }
    while (v20);
  }

  id v26 = [v69 copy];
  id v27 = [v17 copy];
  [(IDSGroupEncryptionController1 *)self _updateAllActiveParticipantsInfoFromParticipants:v70 standardParticipantsPushTokens:v26 lightweightParticipantsPushTokens:v27 groupID:v9];

  id v28 = [v69 mutableCopy];
  id v29 = v65;
  id v30 = [v65 mutableCopy];
  os_unfair_lock_lock(lock);
  [v28 removeObjectsInArray:v65];
  [v30 removeObjectsInArray:v69];
  +[NSString stringWithFormat:@"_updateStandardParticipants: groupID: %@, previous %@, new %@", v9, v65, v69];
  long long v90 = _NSConcreteStackBlock;
  uint64_t v91 = 3221225472;
  id v92 = sub_1001B4640;
  id v93 = &unk_10097E4D0;
  id v94 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v94;
  cut_dispatch_log_queue();
  id v32 = +[NSString stringWithFormat:@"_updateStandardParticipants: groupID: %@, added diff %@, removed diff %@", v9, v28, v30];

  dispatch_block_t v85 = _NSConcreteStackBlock;
  uint64_t v86 = 3221225472;
  long long v87 = sub_1001B4714;
  long long v88 = &unk_10097E4D0;
  id v60 = v32;
  id v89 = v60;
  cut_dispatch_log_queue();
  uint64_t v64 = v30;
  if ([v30 count])
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v33 = v30;
    id v34 = [v33 countByEnumeratingWithState:&v81 objects:v109 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v82;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v82 != v36) {
            objc_enumerationMutation(v33);
          }
          [(IDSGroupEncryptionController1 *)self _noteKeyMaterialNotNeededForDestination:*(void *)(*((void *)&v81 + 1) + 8 * (void)j) groupID:v9];
        }
        id v35 = [v33 countByEnumeratingWithState:&v81 objects:v109 count:16];
      }
      while (v35);
    }
  }
  id v38 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v9];
  id v39 = [v38 mutableCopy];

  id v59 = v39;
  id v61 = v28;
  id v40 = [(IDSGroupEncryptionController1 *)self _getAndUpdateParticipantsWaitingForKeyMaterialsForGroup:v9 waitingParticipants:v39 addedParticipantsDiff:v28 currentParticipantsPushTokens:v69 participantType:0];
  uint64_t v41 = [(IDSGroupEncryptionController1 *)self _localDevicePushToken];
  __int16 v58 = (void *)v41;
  if (v41)
  {
    unsigned __int8 v42 = [v65 containsObject:v41];
    id v43 = [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:v9];
    unsigned __int8 v44 = [v43 containsObject:v41];

    LOBYTE(v41) = v42 & v44;
  }
  os_unfair_lock_unlock(lock);
  id v45 = v66;
  if ([v40 count])
  {
    id v46 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v9];
    dispatch_block_t v47 = +[NSString stringWithFormat:@"_updateStandardParticipants - Sending the key material to %@ of the group %@ (pending participants %@)", v40, v9, v46];

    long long v76 = _NSConcreteStackBlock;
    uint64_t v77 = 3221225472;
    uint64_t v78 = sub_1001B47E8;
    int64_t v79 = &unk_10097E4D0;
    id v80 = v47;
    os_unfair_lock_t locka = v47;
    cut_dispatch_log_queue();
    long long v48 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001B48BC;
    block[3] = &unk_100984CA0;
    void block[4] = self;
    id v49 = v9;
    id v72 = v49;
    id v50 = v63;
    id v73 = v50;
    id v74 = v40;
    char v75 = v41;
    dispatch_block_t v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v48, v51);

    long long v52 = v63;
    id v29 = v65;

    id v53 = v49;
    id v45 = v66;
    [(IDSGroupEncryptionController1 *)self requestPendingKeyMaterialsForGroup:v53 sessionID:v50];

    long long v54 = locka;
    id v55 = v62;
  }
  else
  {
    id v56 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      id v57 = [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:v9];
      *(_DWORD *)buf = 138412802;
      long long v104 = v40;
      __int16 v105 = 2112;
      id v106 = v9;
      __int16 v107 = 2112;
      __int16 v108 = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "_updateStandardParticipants - didn't send any key materials to %@ of the group %@ (pending participants %@)", buf, 0x20u);
    }
    id v55 = v62;
    long long v52 = v63;
    long long v54 = v56;
  }

  [(IDSGroupEncryptionController1 *)self _dispatchDeferredPrekeyRequestForGroupID:v9 previousParticipantsPushTokens:v29 currentActiveParticipants:v45 sessionID:v52];
}

- (void)didUpdateParticipants:(id)a3 ofType:(int64_t)a4 forGroup:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  [(IDSGroupEncryptionController1 *)self removeExpiredPrekeys];
  if (a4 == 1)
  {
    [(IDSGroupEncryptionController1 *)self _updateLightweightParticipants:v10 forGroup:v12 sessionID:v11];
  }
  else if (a4)
  {
    id v13 = +[IDSFoundationLog RealTimeEncryptionController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100715E1C();
    }
  }
  else
  {
    [(IDSGroupEncryptionController1 *)self _updateStandardParticipants:v10 forGroup:v12 sessionID:v11];
  }
  [(IDSGroupEncryptionController1 *)self updateServerDesiredKeyMaterialsForGroup:v12 sessionID:v11];
}

- (void)account:(id)a3 didUpdateRegisteredDevices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v33 = self;
  id v8 = [(IDSGroupEncryptionController1 *)self sessionController];
  id v32 = [v8 groupSessionGroupIDs];

  if (([v6 isRegistered] & 1) == 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = v32;
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          id v15 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1001B4DC0;
          block[3] = &unk_10097E440;
          void block[4] = v33;
          void block[5] = v14;
          dispatch_async(v15, block);
        }
        id v11 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v11);
    }
  }
  lastKnownAccountIDToPushTokens = v33->_lastKnownAccountIDToPushTokens;
  id v17 = [v6 uniqueID];
  id v31 = [(NSMutableDictionary *)lastKnownAccountIDToPushTokens objectForKeyedSubscript:v17];

  id v18 = objc_alloc_init((Class)NSMutableSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  id v19 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)j), "pushToken", v31);
        id v24 = [v6 service];
        unsigned int v25 = [v24 identifier];
        id v26 = +[IDSPushToken pushTokenWithData:v23 withServiceLoggingHint:v25];
        [v18 addObject:v26];
      }
      id v20 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v20);
  }

  os_unfair_lock_lock(&v33->_lock);
  id v27 = v33->_lastKnownAccountIDToPushTokens;
  id v28 = [v6 uniqueID];
  [(NSMutableDictionary *)v27 setObject:v18 forKeyedSubscript:v28];

  os_unfair_lock_unlock(&v33->_lock);
  id v29 = +[IDSFoundationLog RealTimeEncryptionController];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = [v6 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v45 = obj;
    __int16 v46 = 2112;
    dispatch_block_t v47 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "didUpdateRegisteredDevices: %@ for account: %@", buf, 0x16u);
  }
  if (([v18 isEqualToSet:v31] & 1) == 0) {
    [(IDSGroupEncryptionController1 *)v33 rollNewKeysAfterResettingPrekeysForGroups:v32 withReason:1];
  }
}

- (id)keyMaterialCacheToGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_groupIDToKeyMaterialCache objectForKeyedSubscript:a3];
}

- (id)stablekeyMaterialCacheToGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_groupIDToStableKeyMaterialCache objectForKeyedSubscript:a3];
}

- (id)getParticipantsWaitingForKeyMaterials:(id)a3
{
  return [(NSMutableDictionary *)self->_participantsWaitingForKeyMaterials objectForKeyedSubscript:a3];
}

- (id)getParticipantsWaitingForStableKeyMaterials:(id)a3
{
  return [(NSMutableDictionary *)self->_participantsWaitingForStableKeyMaterials objectForKeyedSubscript:a3];
}

- (id)getParticipantsWaitingForInitialKeyMaterials:(id)a3
{
  return [(NSMutableDictionary *)self->_participantsWaitingForInitialKeyMaterials objectForKeyedSubscript:a3];
}

- (id)getParticipantsForGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_participantsForGroup objectForKeyedSubscript:a3];
}

- (id)getParticipantsForGroup:(id)a3 ofType:(int64_t)a4
{
  id v5 = [(NSMutableDictionary *)self->_groupIDToTypeToParticipantsPushTokens objectForKeyedSubscript:a3];
  id v6 = +[NSNumber numberWithInteger:a4];
  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)getParticipantsInfoForGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_participantsInfoForGroup objectForKeyedSubscript:a3];
}

- (id)getMembersForGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_membersForGroup objectForKeyedSubscript:a3];
}

- (id)getLightweightStatusDictForGroup:(id)a3
{
  return [(NSMutableDictionary *)self->_membersLightweightStatusDict objectForKeyedSubscript:a3];
}

- (__SecKey)fullIdentityKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_identityForDevice fullIdentity];
}

- (unint64_t)participantIDForPushToken:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_participantsInfoForGroup;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "participantPushToken", (void)v14);
        id v11 = [v4 rawToken];
        unsigned __int8 v12 = [v10 isEqualToData:v11];

        if (v12)
        {
          id v6 = [v9 participantIdentifier];
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (unint64_t)v6;
}

- (__SecKey)previousFullIdentityKey
{
  return [(IDSRealTimeEncryptionIdentity *)self->_previousIdentityForDevice fullIdentity];
}

- (void)setSessionController:(id)a3
{
}

- (BOOL)isTestRunning
{
  return self->_isTestRunning;
}

- (void)setIsTestRunning:(BOOL)a3
{
  self->_isTestRunning = a3;
}

- (BOOL)fakeMKMWrapping
{
  return self->_fakeMKMWrapping;
}

- (void)setFakeMKMWrapping:(BOOL)a3
{
  self->_fakeMKMWrapping = a3;
}

- (NSMutableDictionary)groupIDToStableKeyMaterialCache
{
  return self->_groupIDToStableKeyMaterialCache;
}

- (NSMutableDictionary)groupIDToKeyMaterialCache
{
  return self->_groupIDToKeyMaterialCache;
}

- (IDSRealTimeEncryptionIdentity)identityForDevice
{
  return self->_identityForDevice;
}

- (IDSRealTimeEncryptionIdentity)previousIdentityForDevice
{
  return self->_previousIdentityForDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointUpdateTimer, 0);
  objc_storeStrong((id *)&self->_preKeyChangeHandlers, 0);
  objc_storeStrong((id *)&self->_groupIDToLastMemberAddDate, 0);
  objc_storeStrong((id *)&self->_groupIDToInitialKeyMaterialDistributionTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_groupIDToIsDeferredPreKeyRequestPending, 0);
  objc_storeStrong((id *)&self->_groupIDToIsKeyMaterialRecoveryRunning, 0);
  objc_storeStrong((id *)&self->_groupIDToSKMRecoveryRetryCount, 0);
  objc_storeStrong((id *)&self->_groupIDToMKMRecoveryRetryCount, 0);
  objc_storeStrong((id *)&self->_groupIDToMKMRollTimerBlock, 0);
  objc_storeStrong((id *)&self->_groupIDToMKMRollTimer, 0);
  objc_storeStrong((id *)&self->_groupIDToMKMExpirationTimerBlock, 0);
  objc_storeStrong((id *)&self->_groupIDToMKMExpirationTimer, 0);
  objc_storeStrong((id *)&self->_encryptionSequenceNumbers, 0);
  objc_storeStrong((id *)&self->_groupIDToResetKeyMaterialCacheTimer, 0);
  objc_storeStrong((id *)&self->_pendingStableKeyMaterials, 0);
  objc_storeStrong((id *)&self->_pendingMasterKeyMaterials, 0);
  objc_storeStrong((id *)&self->_lastKnownAccountIDToPushTokens, 0);
  objc_storeStrong((id *)&self->_lastKnownGroupIDToPushTokens, 0);
  objc_storeStrong((id *)&self->_endpointSubscriptionForGroup, 0);
  objc_storeStrong((id *)&self->_participantsWaitingForInitialKeyMaterials, 0);
  objc_storeStrong((id *)&self->_participantsWaitingForStableKeyMaterials, 0);
  objc_storeStrong((id *)&self->_participantsWaitingForKeyMaterials, 0);
  objc_storeStrong((id *)&self->_groupIDToLocalParticipantID, 0);
  objc_storeStrong((id *)&self->_participantsInfoForGroup, 0);
  objc_storeStrong((id *)&self->_groupIDToTypeToParticipantsPushTokens, 0);
  objc_storeStrong((id *)&self->_participantsForGroup, 0);
  objc_storeStrong((id *)&self->_membersLightweightStatusDict, 0);
  objc_storeStrong((id *)&self->_membersForGroup, 0);
  objc_storeStrong((id *)&self->_groupIDToStableKeyMaterialCache, 0);
  objc_storeStrong((id *)&self->_groupIDToKeyMaterialCache, 0);
  objc_storeStrong((id *)&self->_publicKeyForDevice, 0);
  objc_storeStrong((id *)&self->_prekeyAckCountForGroup, 0);
  objc_storeStrong((id *)&self->_previousIdentityForDevice, 0);
  objc_storeStrong((id *)&self->_identityForDevice, 0);
  objc_storeStrong((id *)&self->_fromURIs, 0);
  objc_storeStrong((id *)&self->_accountIDs, 0);
  objc_storeStrong((id *)&self->_p2pNegotiatorProvider, 0);
  objc_storeStrong((id *)&self->_realtimeEncryptionQueue, 0);

  objc_storeStrong(&self->_sessionController, 0);
}

@end